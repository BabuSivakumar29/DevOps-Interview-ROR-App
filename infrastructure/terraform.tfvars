# ##################
# Variables
# ##################

project_name		= "ror-app"
aws_region		= "eu-west-1"
vpc_cidr		= "10.0.0.0/16"
public_subnet_cidrs	= ["10.0.2.0/24", "10.0.4.0/24"]
private_subnet_cidrs	= ["10.0.1.0/24", "10.0.3.0/24"]
allowed_vpc_cidrs	= ["10.0.0.0/16"]
s3_bucket_name		= "s3-bucket-ror-application"
identifier		= "rds-ror-application"
engine			= "postgres"
engine_version		= "13.15"
instance_class		= "db.t3.micro"
db_storage		= "10"
db_username		= "postgres"
db_password		= "SuperUser!123$"
db_name			= "postgres"
ecr_repo_name		= "ror-application-repo"
ecs-instance-role	= "ror-app-ec2-role"
ecs-instance-profile	= "ror-app-ec2-profile"
ecs_launch_template	= "ror-app-ecs-lt"
instance_type		= "t3.micro"
target_group		= "ror-app-tg"
alb_name		= "ror-app-alb"
autoscaling_name	= "ror-autoscaling-group"
ecs_cluster_name	= "ror-application-ecs-cluster"
