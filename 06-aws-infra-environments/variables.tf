#--------------- provider.tf variables ---------------
variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "aws_region" {
  description = "AWS Region you want to deploy resources in"
  type        = string
  default     = "ap-south-1"
}

# ---------------ec2 module variables -------------------
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance types for the EC2 Instance according to the environment"
  type        = map(string)
}

# ---------------RDS module variables -------------------
variable "db_instance_class" {
  description = "RDS instance class according to the environment"
  type        = map(string)
}
variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
}


# -------------- Networking ---------------------------------
variable "subnets" {
    description = "Subnets for alb, asg, listners"
    type = list(string)
}
variable "vpc_id" {
    description = "vpc id"
    type = string
} 



