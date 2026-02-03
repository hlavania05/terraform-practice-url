variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type = string
}

variable "instance_type" {
    description = "Instance types for the EC2 Instance"
    type = string
}

variable "key_name" {
    description = "Key pair name for the EC2 instance"
    type = string
}

variable "security_group" {
    description = "Security group for the EC2 instance"
    type = string
}

variable "target_group_arn" {
    description = "Target group arns so that launch ec2 instance will auto matic added to the Load balancer target group"
    type = string
}

variable "subnets" {
    description = "Subnets for alb, asg, listners"
    type = list(string)
}
