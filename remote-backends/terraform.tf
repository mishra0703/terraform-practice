terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

backend "s3" {
    bucket         = "remote-bucket-by-prem"
    dynamodb_table = "remote-dynamoDB-table"
    key            = "terraform.tfstate"
    region         = "ap-southeast-2"
  }

}
