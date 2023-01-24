output "instance_ip" {
    value = aws_instance.Simple-instance.*.public_ip
}