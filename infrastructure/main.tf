module "vpc" {
  source		= "./modules/vpc"
  project_name		= var.project_name
  vpc_cidr		= var.vpc_cidr
  public_subnet_cidrs	= var.public_subnet_cidrs
  private_subnet_cidrs	= var.private_subnet_cidrs
}

module "rds" {
  source		= "./modules/rds"
  project_name		= var.project_name
  vpc_id		= module.vpc.vpc_id
  private_subnet_ids	= module.vpc.private_subnet_ids
  identifier		= var.identifier
  engine		= var.engine
  engine_version	= var.engine_version
  instance_class	= var.instance_class
  db_storage		= var.db_storage
  db_username		= var.db_username
  db_password		= var.db_password
  db_name		= var.db_name
}

#module "s3" {
#  source		= "./modules/s3"
#  s3_bucket_name	= var.s3_bucket_name
#}

