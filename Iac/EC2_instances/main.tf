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

resource "aws_instance" "Simple-instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.ssh_connection.name]
  tags            = var.tags
}

resource "aws_security_group" "ssh_connection" {
  name        = var.sg_name

  dynamic "ingress" {
    for_each = var.ingress_rule
    content {
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
    }
  }
}
