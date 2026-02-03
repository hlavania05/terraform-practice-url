resource aws_lb "app_alb" {
    name = "${terraform.workspace}-app-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [var.security_group]
    subnets = var.subnets
}

resource aws_lb_target_group "this_tg" {
    name = "${terraform.workspace}-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
    health_check {
        path = "/"
    } 
}

resource aws_lb_listener "this_listner" {
    load_balancer_arn = aws_lb.app_alb.id
    port = 80
    protocol = "HTTP"
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.this_tg.arn
    }
}