resource "aws_instance" "my_instance" {
  ami                    = var.ami_id
  instance_type          = lookup(var.instance_type, terraform.workspace)
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y apache2
    sudo systemctl enable apache2
    sudo systemctl start apache2
  EOF

  tags = {
    Name        = "web-${terraform.workspace}"
    Environment = terraform.workspace
  }
}


