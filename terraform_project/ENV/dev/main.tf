module "vpc" {
  source = "../../Module/VPC"
  vpc_name = var.vpc_name
}

#azar2

#webasha

module "subnet" {
  source = "../../Module/subnet"
  subnet_name = var.subnet_name
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "../../Module/ec2"
  instance_name = var.instance_name
  subnet_id = module.subnet.subnet_id
  
}
