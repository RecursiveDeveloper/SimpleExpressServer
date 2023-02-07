terraform {
    backend "s3" {
        bucket          = "backend-terraform-simple"
        key             = "prod-state"
        region          = "us-east-1"
#        encrypt         = true
#        kms_key_id      = "alias/Simple-key"
    }
}
