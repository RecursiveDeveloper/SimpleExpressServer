resource "aws_iam_policy" "Simple-s3-policy" {
  name        = "S3-Bucket-Access-Policy"
  description = "Provides permission to access S3"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": "*"
        }
    ]
  })
}

resource "aws_iam_role" "Simple-role" {
  name = "Ec2-role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "Simple-attach" {
  role        = aws_iam_role.Simple-role.name
  policy_arn  = aws_iam_policy.Simple-s3-policy.arn
}

resource "aws_iam_instance_profile" "Simple-instance-profile" {
  name = "Simple-instance-profile"
  role = aws_iam_role.Simple-role.name
}

resource "aws_instance" "Simple-instance" {
  ami                   = var.ami_id
  instance_type         = var.instance_type
  iam_instance_profile  = aws_iam_instance_profile.Simple-instance-profile.name
  security_groups       = [aws_security_group.ssh_connection.name]
  tags                  = var.tags

  user_data = "${file("user-data-ubuntu.sh")}"
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

  dynamic "egress" {
    for_each = var.egress_rule
    content {
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
    }
  }
}
