resource "aws_eip" "my_eip" {
    instance = aws_instance.my_instance.id
}

output "instance_aws_eip" {
    value = aws_eip.my_eip.public_ip
}