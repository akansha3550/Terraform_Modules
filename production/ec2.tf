module "prod_ec2_1" {
  source      = "../modules/compute"
  environment = module.prod_vpc_1.environment
  amis = {
    us-east-1 = "ami-084568db4383264d4"
    us-east-2 = "ami-04f167a56786e4b09"
  }
  aws_region      = var.aws_region
  key_name        = "myapp"
  public_subnets  = module.prod_vpc_1.public-subnet
  private_subnets = module.prod_vpc_1.private-subnet
  sg_id           = module.prod_sg_1.sg_id
  vpc_name        = module.prod_vpc_1.vpc_name
}
