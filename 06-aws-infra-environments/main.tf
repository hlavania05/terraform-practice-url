module "alb" {
  source         = "./modules/alb"
  security_group = aws_security_group.alb_sg.id
  vpc_id = var.vpc_id
  subnets = var.subnets
}
module "ec2" {
  source           = "./modules/ec2"
  ami_id           = var.ami_id
  instance_type    = lookup(var.instance_type, terraform.workspace)
  key_name         = aws_key_pair.deployer_key.key_name
  security_group   = aws_security_group.ec2_sg.id
  target_group_arn = module.alb.target_group_arn
  subnets = var.subnets
}
module "rds" {
  source            = "./modules/rds"
  db_instance_class = lookup(var.db_instance_class, terraform.workspace)
  db_username       = var.db_username
}