ami_id          = "ami-007855ac798b5175e"

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
    {
        from_port   = "3000"
        to_port     = "3000"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
]

egress_rule     = [
    {
        from_port   = "0"
        to_port     = "0"
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    },
]
