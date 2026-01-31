# Creates an SSH key pair to access the EC2 instance
resource "aws_key_pair" "my_key_pair" {
  key_name   = "my_key_pair"
  public_key = file("${path.module}/tf-key-pair.pub")
}

# Creates a security group to control inbound and outbound traffic
resource "aws_security_group" "sg_dev_env" {
  name        = "sg_dev_env"
  description = "here you can deploy your static webste using nginx"

  dynamic "ingress" {        # Dynamically creates ingress rules for multiple ports
    for_each = [22, 80, 443, 27017]
    iterator = port
    content {
      description = "allow http ${port.value} access"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {                   # Allows all outbound traffic from the instance
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launches an EC2 instance with the defined configuration
resource "aws_instance" "my_instance" {
  ami                    = "ami-087d1c9a513324697"
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.sg_dev_env.id]
  tags = {
    name = "tf-dev-env"
  }
}