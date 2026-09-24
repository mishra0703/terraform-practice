terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


# Terraform can't initialize a backend against a bucket that isn't there
# So first we need to comment this backend and have to create s3 bucket and dynamoDB table 
# terraform init → terraform apply 
# A new bucket and dynamo table will get created , then we can uncomment this backend block and Re-init the infrastructure to migrate the state from local → S3

backend "s3" {
    bucket         = "remote-bucket-by-prem"
    dynamodb_table = "remote-dynamoDB-table"
    key            = "terraform.tfstate"
    region         = "ap-southeast-2"
  }

}
