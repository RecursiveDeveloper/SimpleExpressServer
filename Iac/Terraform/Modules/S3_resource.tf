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
