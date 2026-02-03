# provider variables
aws_access_key = "<your_aws_access_token>"
aws_secret_key = "<your_aws_secret_token>"

# ec2 module variables
ami_id = "<instace_ami_id>"
instance_type = {
  "dev"  = "t3.small"
  "prod" = "t3.medium"
  "qa"   = "t3.micro"
}

# rds module variables
db_instance_class = {
  "dev"  = "db.t3.micro"
  "prod" = "db.t3.micro"
  "qa"   = "db.t3.micro"
}
db_username = "hlavania"

# Networking
vpc_id = "vpc-0d2e28252a2432d29"
subnets = ["subnet-0ffcfce3fb58f9638", "subnet-0814e99a67173b30c", "subnet-00f7929fc98599a7e"]
