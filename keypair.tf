resource "aws_key_pair" "ec2_key" {
  key_name   = var.keypair_name
  public_key = file("${var.keypair_name}.pub")
}