ami_id          = "ami-0b5eea76982371e91"
instance_type   = "t2.micro"
tags            = {
    Name        = "Simple-Express", 
    Environment = "Prod"
}
sg_name         = "Simple-sg"
ingress_rule    = [
    {
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    },
    {
        from_port   = "80"
        to_port     = "80"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    },
]
