provider "aws" {
  region = "us-east-1"
}

variable "data_bucket" {
  description = "The bucket created by the database stack"
  default     = "not-configured"
}

resource "aws_s3_bucket" "app_storage" {
  bucket_prefix = "orbit-labs-app-"

  tags = {
    name        = "Orbit Labs App Storage"
    managedBy   = "Spacelift"
    type        = "application"
    data_bucket = var.data_bucket
  }
}

output "app_bucket" {
  value = aws_s3_bucket.app_storage.id
}

output "data_bucket_reference" {
  value = var.data_bucket
}
