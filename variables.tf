# variables.tf - Config ที่เป็นศูนย์กลาง

# *=== Project Name ===*
variable "project_name" {
  default = "biovanta"
}

variable "environment" {
  default = "dev"
}

variable "instance_number" {
  default = "00"
}

variable "aws_region" {
  default = "ap-southeast-1"
}

# *=== EC2 Configuration ===*
variable "instance_type" {
  default = "t3.micro"  # ลองเปลี่ยนจาก t2.micro เป็น t3.micro ดูครับ
}

variable "ami_id" {
  default = "ami-0c687e8f5c4e54af5"
}

# *=== Keypair Configuration ===*
variable "keypair_name" {
  default = "terraform-ec2-key"
}

# *=== Security Group Configuration ===*
variable "sg_name" {
  default = "terraform-ssh-sg"
}

variable "sg_description" {
  default = "Allow SSH access"
}

# *=== Local variables for naming ===*
locals {
  instance_name    = "${var.project_name}-${var.environment}-${var.instance_number}"
  sg_name          = "${var.sg_name}-${var.instance_number}"
}