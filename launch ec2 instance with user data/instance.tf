# EC2 instance resource
# EC2 instance with user data script to install apache2 and deploy a static website
resource "aws_instance" "my_instance" {
  ami           = "ami-087d1c9a513324697"
  instance_type = "t3.micro"
  key_name               = "my_key_pair"
  vpc_security_group_ids = ["sg-07b33a44c1e796bac"]
  user_data              = file("${path.module}/user_data.sh")
  tags = {
    Name = "static deployment using userdata"
  }
}

# Output the public IP of the EC2 instance
output "instance_public_ip" {
  value = aws_instance.my_instance.public_ip
}