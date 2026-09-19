output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.my_existing_server.id
}


output "instance_public_ip" {
  description = "The Public Ip of instance"
  value       = aws_instance.my_existing_server.public_ip
}


output "instance_public_dns" {
  description = "The Public DNS of instance"
  value       = aws_instance.my_existing_server.public_dns
}


output "instance_ami_id" {
  description = "The ID of the AMI used by the EC2 instance"
  value       = aws_instance.my_existing_server.ami
}


output "root_block_storage" {
  description = "Root block device attributes"
  value = [
    for block in aws_instance.my_existing_server.root_block_device : {
      volume_id   = block.volume_id
      volume_size = block.volume_size
      volume_type = block.volume_type
    }
  ]
}

