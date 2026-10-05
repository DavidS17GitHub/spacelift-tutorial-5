provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "data_store" {
  bucket_prefix = "orbit-labs-db-"

  tags = {
    name      = "Orbit Labs Data Store"
    managedBy = "Spacelift"
    type      = "database"
  }
}

output "data_store_bucket" {
  value = aws_s3_bucket.data_store.id
}
