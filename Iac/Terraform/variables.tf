variable "ami_id" {
    default     = ""
    description = "Ami ID"
}

variable "instance_type" {
}

variable "tags" {
    type        = map(string)
}

variable "sg_name" {
}

variable "ingress_rule" {
}

variable "egress_rule" {
}

variable "bucket_name" {
    default     = "backend-terraform-simple"
}

variable "acl" {
    default     = "private"
}
