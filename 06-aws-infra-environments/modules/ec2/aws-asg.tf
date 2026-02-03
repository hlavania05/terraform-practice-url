resource aws_autoscaling_group "asg" {
    name = "ec2_asg"
    max_size = 4 
    min_size = 2
    desired_capacity = 2
    target_group_arns = [var.target_group_arn]
    vpc_zone_identifier = var.subnets
    launch_template {
        id = aws_launch_template.ec2_instance.id
        version = "$Latest"
    }
    tag {
        key = "Environment"
        value = terraform.workspace
        propagate_at_launch = true
    }
}