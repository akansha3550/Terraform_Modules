module "dev_ec2_1" {
  source      = "../modules/compute"
  environment = module.dev_vpc_1.environment
  amis = {
    us-east-1 = "ami-084568db4383264d4"
    us-east-2 = "ami-04f167a56786e4b09"
  }
  aws_region           = var.aws_region
  key_name             = "myapp"
  public_subnets       = module.dev_vpc_1.public_subnets_id
  private_subnets      = module.dev_vpc_1.private_subnets_id
  sg_id                = module.dev_sg_1.sg_id
  vpc_name             = module.dev_vpc_1.vpc_name
  elb_listener         = module.dev_elb_1.elb_listner
  elb_listener_public  = module.dev_elb_1_public.elb_listner
  iam_instance_profile = module.dev_iam_1.instprofile

}

module "dev_elb_1" {
  source          = "../modules/elb"
  nlbname         = "dev-nlb"
  subnets         = module.dev_vpc_1.public_subnets_id
  environment     = module.dev_vpc_1.environment
  tgname          = "dev-nlb-tg"
  vpc_id          = module.dev_vpc_1.vpc_id
  private_servers = module.dev_ec2_1.private_servers
}

module "dev_elb_1_public" {
  source          = "../modules/elb"
  environment     = module.dev_vpc_1.environment
  nlbname         = "dev-nlb-public"
  subnets         = module.dev_vpc_1.public_subnets_id
  tgname          = "dev-nlb-tg-public"
  vpc_id          = module.dev_vpc_1.vpc_id
  private_servers = module.dev_ec2_1.public_servers
}

module "dev_iam_1" {
  source              = "../modules/iam"
  environment         = module.dev_vpc_1.environment
  rolename            = "AkanshaRole"
  instanceprofilename = "Akanshainstaprofile"
}