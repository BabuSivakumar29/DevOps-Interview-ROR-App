module "vpc" {
  source               = "./modules/vpc"
  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "rds" {
  source             = "./modules/rds"
  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  allowed_vpc_cidrs  = var.allowed_vpc_cidrs
  private_subnet_ids = module.vpc.private_subnet_ids
  engine             = var.engine
  engine_version     = var.engine_version
  instance_class     = var.instance_class
  rds_hostname       = var.rds_hostname
  rds_storage        = var.rds_storage
  rds_username       = var.rds_username
  rds_password       = var.rds_password
  rds_db_name        = var.rds_db_name
}

module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = var.s3_bucket_name
}

module "ecr" {
  source        = "./modules/ecr"
  ecr_repo_name = var.ecr_repo_name
}

module "iam" {
  source               = "./modules/iam"
  ec2-instance-role    = var.ec2-instance-role
  ec2-instance-profile = var.ec2-instance-profile
  ecs-task-exec-role   = var.ecs-task-exec-role
}

module "ec2" {
  source                    = "./modules/ec2"
  vpc_id                    = module.vpc.vpc_id
  allowed_vpc_cidrs         = var.allowed_vpc_cidrs
  ecs_launch_template       = var.ecs_launch_template
  instance_type             = var.instance_type
  ec2_instance_profile_name = module.iam.ec2_instance_profile_name
  ecs_cluster_name          = module.ecs.ecs_cluster_name
}

module "elb" {
  source                 = "./modules/elb"
  target_group           = var.target_group
  vpc_id                 = module.vpc.vpc_id
  allowed_vpc_cidrs      = var.allowed_vpc_cidrs
  project_name           = var.project_name
  alb_name               = var.alb_name
  autoscaling_name       = var.autoscaling_name
  ecs_launch_template_id = module.ec2.ecs_launch_template_id
  ecs_cluster_name       = var.ecs_cluster_name
  public_subnet_ids      = module.vpc.public_subnet_ids
  private_subnet_ids     = module.vpc.private_subnet_ids
}

module "ecs" {
  source                = "./modules/ecs"
  project_name          = var.project_name
  ecs-task-definition   = var.ecs-task-definition
  ecs_task_exec_role    = module.iam.ecs_task_execution_role_arn
  app_image             = var.app_image
  nginx_image           = var.nginx_image
  rds_db_name           = var.rds_db_name
  rds_username          = var.rds_username
  rds_password          = var.rds_password
  rds_hostname          = var.rds_hostname
  rds_port              = var.rds_port
  s3_bucket_name        = var.s3_bucket_name
  s3_region_name        = var.s3_region_name
  lb_endpoint           = module.elb.alb_dns_name
  aws_region            = var.aws_region
  ecs_cp                = var.ecs_cp
  ecs_service_name      = var.ecs_service_name
  private_subnet_ids    = module.vpc.private_subnet_ids
  ecs_security_group_id = module.ec2.ecs_security_group_id
  alb_target_group_arn  = module.elb.target_group_arn
  lb_listener_arn	= module.elb.alb_listener_arn
}
