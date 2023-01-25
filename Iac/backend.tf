terraform {
    backend "s3" {
        bucket  = "backend-terraform-simple"
        key     = "prod"
        region  = "us-east-1"
    }
}