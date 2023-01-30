terraform {
    backend "s3" {
        bucket          = "backend-terraform-simple"
        key             = "prod"
        region          = "us-east-1"
        encrypt         = true
        kms_key_id      = "arn:aws:kms:us-east-1:819458181218:key/f7f38eae-0318-49d2-8b05-552e06fadf7b"
    }
}
