provider "aws" {
  region = "us-east-1"
}

variable "env" {
  description = "Environment name"
}

resource "aws_s3_bucket" "env_bucket" {
  bucket_prefix = "orbit-labs-${var.env}-"

  tags = {
    name        = "Orbit Labs ${var.env}"
    managedBy   = "Spacelift"
    environment = var.env
  }
}

output "bucket_name" {
  value = aws_s3_bucket.env_bucket.id
}
