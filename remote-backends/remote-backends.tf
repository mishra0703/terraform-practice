# S3 Bucket for Terraform State (AWS)

resource "aws_s3_bucket" "terraform_state" {
  bucket        = "remote-bucket-by-prem"

  tags = {
    Name = "bucket-for-remote-backends"
  }
}



# DynamoDB for State Locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "remote-dynamoDB-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}