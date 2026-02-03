resource aws_launch_template "ec2_instance" { 
    image_id = var.ami_id
    instance_type = var.instance_type 
    key_name = var.key_name
    vpc_security_group_ids = [var.security_group]
    tags = {
        Name = "${terraform.workspace}-instance"
    }
    user_data = base64encode(
       file("${path.module}/user-data.sh")
    )

}