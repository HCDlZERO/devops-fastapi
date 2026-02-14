terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# ----------------------------------------------------
# 🔍 ส่วนใหม่: ให้ Terraform ค้นหา AMI Ubuntu ล่าสุดเอง
# ----------------------------------------------------
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # รหัสเจ้าของคือ Canonical (ผู้ทำ Ubuntu) ของแท้

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ----------------------------------------------------
# สร้าง Server EC2
# ----------------------------------------------------
resource "aws_instance" "biovanta_ec2" {
  # ❌ เลิกใช้ var.ami_id แบบเก่า
  # ✅ ใช้ id ที่ค้นหามาได้สดๆ แทน
  ami                    = data.aws_ami.ubuntu.id
  
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  user_data              = file("${path.module}/user_docker.sh")

  tags = {
    Name = local.instance_name
  }
}