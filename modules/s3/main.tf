terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.name}-bucket"
  acl    = "private"

  versioning = {
    enabled = true
  }
}