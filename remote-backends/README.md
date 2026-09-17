## Creating a remote backend with state locking for Terraform

We need an object storage service to save the state file and a locking/consistency service (or native object locking) to prevent concurrent changes.

In AWS those services names are : 

- *Amazon S3* : To store the .tfstate file.
- *Amazon DynamoDB Table*  : Table with a primary key named LockID