provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "Simple-backend" {
  bucket          = var.bucket_name
  acl             = var.acl
  tags            = var.tags
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.Simple-backend.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_kms_key" "Simple-key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_kms_alias" "Simple-key-alias" {
  name          = "alias/Simple-key"
  target_key_id = aws_kms_key.Simple-key.key_id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "Simple-sse" {
  bucket = var.bucket_name

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.Simple-key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
