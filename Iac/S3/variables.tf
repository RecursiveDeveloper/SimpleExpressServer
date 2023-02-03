variable "tags" {
    type        = map(string)
}

variable "bucket_name" {
    default     = "backend-terraform-simple"
}

variable "acl" {
    default     = "private"
}
