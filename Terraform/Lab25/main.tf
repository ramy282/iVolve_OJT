provider "aws" {
  region = var.region
  profile = "default"
}


module "Network" {
  source                 = "./modules/Network"
  vpc_cidr               = var.vpc_cidr
  vpc_name               = var.vpc_name
  public_subnet_cidrs    = var.public_subnet_cidrs
  public_subnet_azs      = var.public_subnet_azs
  private_subnet_cidrs   = var.private_subnet_cidrs 
  private_subnet_azs     = var.private_subnet_azs
}

module "aws_ec2" {
  source                 = "./modules/aws_ec2"
  ami                    = var.ami
  sg                     = var.sg         
  instance_type          = var.instance_type
  vpc_id                 = module.Network.vpc_id
  public_subnet_ids      = module.Network.public_subnet_ids
  
}

module "rds_database" {
  source                 = "./modules/rds_database"
  vpc_id              = module.Network.vpc_id
  private_subnet_ids  = module.Network.private_subnet_ids
  allocated_storage   = var.allocated_storage
  engine              = var.engine
  engine_version      = var.engine_version
  instance_class      = var.instance_class
  db_name             = var.db_name
  db_username         = var.db_username
  db_password         = var.db_password
  parameter_group_name= var.parameter_group_name
  skip_final_snapshot = var.skip_final_snapshot
  db_instance_name    = var.db_instance_name
  
}
