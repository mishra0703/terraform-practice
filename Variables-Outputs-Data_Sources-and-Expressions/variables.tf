variable "aws_region" {
  description = "The AWS region to deploy the VPC into"
  type        = string
  default     = "us-east-1"
}


variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}


variable "subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}


variable "instance_type" {
  description = "The Instance Type of Ec2 Instance"
  type	      = string
  default     = "t2.micro"
}


variable "project_name" {
  description = "Name of the project, used for tagging resources"
  type        = string
}


variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}


variable "allowed_ports" {
  description = "List of ports allowed in the security group"
  type        = list(number)
  default     = [22, 80, 443]
}


variable "extra_tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}
