output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.biovanta_ec2.id
}

output "instance_name" {
  description = "EC2 Name tag"
  value       = aws_instance.biovanta_ec2.tags["Name"]
}

output "public_ip" {
  description = "EC2 Public IP"
  value       = aws_instance.biovanta_ec2.public_ip
}

output "ssh_command" {
  description = "SSH command"
  value       = "ssh -i ${var.keypair_name} ubuntu@${aws_instance.biovanta_ec2.public_ip}"
}