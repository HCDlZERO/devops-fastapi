resource "aws_security_group" "ssh_sg" {
  name        = local.sg_name
  description = var.sg_description

  # อนุญาต SSH
  ingress {
    description = "SSH (lab only)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # อนุญาต Web (Port 8000) - เผื่อไว้สำหรับ FastAPI ของคุณ
  ingress {
    description = "FastAPI Web"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ขาออก (อนุญาตหมด)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}