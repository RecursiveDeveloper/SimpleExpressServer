module "Simple_Express_Server" {
  source        = "./Modules"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  tags          = var.tags
  sg_name       = var.sg_name
  ingress_rule  = var.ingress_rule
  egress_rule   = var.egress_rule
  bucket_name   = var.bucket_name
  acl           = var.acl
}