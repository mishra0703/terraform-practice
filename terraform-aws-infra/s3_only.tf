# Creating s3 bucket with explicit dependency

resource "aws_s3_bucket" "tf-bucket" {
  bucket = "tf-bucket-for-logs"

  depends_on = [aws_instance.terra-server]
}


