terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}




# Creating s3 bucket
resource "aws_s3_bucket" "tf-created-bucket" {
  bucket = "tf-test-bucket-by-prem"
}





# Creating ec2 insance
resource "aws_instance" "tf-test-instance" {
  ami           = "ami-081b0a6eac00b4f53" # OS or AMI Id
  instance_type = "t2.micro"              # Instance type

  tags = {
    Name = "TerraWeek-Modified"
  }
}

