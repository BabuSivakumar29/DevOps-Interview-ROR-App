# ##################
# Variables
# ##################

project_name         = "rails-app"
aws_region           = "eu-west-1"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.2.0/24", "10.0.4.0/24"]
private_subnet_cidrs = ["10.0.1.0/24", "10.0.3.0/24"]
allowed_vpc_cidrs    = ["10.0.0.0/16"]
s3_bucket_name       = "s3-bucket-rails-application"
rds_hostname         = "rails-app-rds"
engine               = "postgres"
engine_version       = "13.15"
instance_class       = "db.t3.micro"
rds_storage          = "10"
rds_username         = "postgres"
rds_password         = "SuperUser!123$"
rds_db_name          = "postgres"
ecr_repo_name        = "rails-app-repo"
ec2-instance-role    = "rails-app-ec2-role"
ec2-instance-profile = "rails-app-ec2-profile"
ecs-task-exec-role   = "rails-app-exec-role"
ecs_launch_template  = "rails-app-ecs-lt"
instance_type        = "t3.micro"
target_group         = "rails-app-tg"
alb_name             = "rails-app-alb"
autoscaling_name     = "rails-autoscaling-group"
ecs_cluster_name     = "rails-app-ecs-cluster"
ecs-task-definition  = "rails-app"
app_image            = ""
nginx_image          = ""
rds_port             = "5432"
s3_region_name       = "eu-west-1"
ecs_cp               = "rails-app-cp"
ecs_service_name     = "rails-app-service"
