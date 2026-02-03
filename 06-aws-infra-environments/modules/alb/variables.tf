variable security_group {
    description = "security group for load balancer"
    type = string
}

variable "subnets" {
    description = "Subnets for alb, asg, listners"
    type = list(string)
}

variable "vpc_id" {
    description = "vpc id"
    type = string
} 