# #################
# Global variables
# ################ 
variable "project_name" {}
variable "aws_region" {}

# ############################
# AWS credentials for provider 
# ############################
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_session_token" {}

# #################
# VPC
# #################
variable "vpc_cidr" {}
variable "allowed_vpc_cidrs" {}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "private_subnet_cidrs" {
  type = list(string)
}

# #################
# RDS
# #################
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "rds_storage" {}
variable "rds_identifier" {}
variable "rds_username" {}
variable "rds_password" {}
variable "rds_db_name" {}

# ##############
# S3
# ##############
variable "s3_bucket_name" {}

# ##############
# ECR
# ##############
variable "backend_repo_name" {}
variable "webserver_repo_name" {}

# ##############
# IAM
# ##############
variable "ec2-instance-role" {}
variable "ec2-instance-profile" {}
variable "ecs-task-exec-role" {}

# ##############
# EC2
# ##############
variable "ecs_launch_template" {}
variable "instance_type" {}

# ##############
# ELB
# ##############
variable "target_group" {}
variable "alb_name" {}
variable "autoscaling_name" {}
variable "ecs_cluster_name" {}

# ##############
# ECS
# ##############
variable "ecs-task-definition" {}
variable "app_image" {}
variable "nginx_image" {}
variable "rds_port" {}
variable "s3_region_name" {}
variable "ecs_cp" {}
variable "ecs_service_name" {}
