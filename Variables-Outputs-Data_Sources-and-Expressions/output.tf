output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.my_vpc.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.public.id
}


output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.terra-server.id
}


output "instance_public_ip" {
  description = "The Public Ip of instance"
  value       = aws_instance.terra-server.public_ip
}


output "instance_public_dns" {
  description = "The Public DNS of instance"
  value       = aws_instance.terra-server.public_dns
}


output "security_group_id" {
  description = "The Security Group ID"
  value       = aws_security_group.vpc_sg.id
}


output "instance_ami_id" {
  description = "The ID of the AMI used by the EC2 instance"
  value       = aws_instance.terra-server.ami
}


output "instance_ami_name" {
  description = "The name of the AMI"
  value       = data.aws_ami.amazon_linux.name
}
