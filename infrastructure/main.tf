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
  allowed_vpc_cidrs	= var.allowed_vpc_cidrs
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

module "s3" {
  source		= "./modules/s3"
  s3_bucket_name	= var.s3_bucket_name
}

module "ecr" {
  source		= "./modules/ecr"
  ecr_repo_name		= var.ecr_repo_name
}

module "iam" {
  source		= "./modules/iam"
  ecs-instance-role	= var.ecs-instance-role
  ecs-instance-profile	= var.ecs-instance-profile
}

module "ec2" {
  source		= "./modules/ec2"
  vpc_id		= module.vpc.vpc_id
  allowed_vpc_cidrs	= var.allowed_vpc_cidrs
  ecs_launch_template	= var.ecs_launch_template
  instance_type		= var.instance_type
  ecs_instance_profile_name = module.iam.ecs_instance_profile_name
}

module "elb" {
  source		= "./modules/elb"
  target_group		= var.target_group
  vpc_id		= module.vpc.vpc_id
  allowed_vpc_cidrs     = var.allowed_vpc_cidrs
  project_name		= var.project_name
  alb_name		= var.alb_name
  autoscaling_name	= var.autoscaling_name
  ecs_launch_template_id= module.ec2.ecs_launch_template_id
  ecs_cluster_name	= var.ecs_cluster_name
  public_subnet_ids	= module.vpc.public_subnet_ids
  private_subnet_ids	= module.vpc.private_subnet_ids
}
