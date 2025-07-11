# ##################
# Variables
# ##################

project_name		= "ror-app"
aws_region		= "eu-west-1"
vpc_cidr		= "10.0.0.0/16"
public_subnet_cidrs	= ["10.0.2.0/24", "10.0.4.0/24"]
private_subnet_cidrs	= ["10.0.1.0/24", "10.0.3.0/24"]
s3_bucket_name		= "s3-bucket-ror-application"
identifier		= "rds-ror-application"
engine			= "postgres"
engine_version		= "13.15"
instance_class		= "db.t3.micro"
db_storage		= "10"
db_username		= "postgres"
db_password		= "SuperUser!123$"
db_name			= "postgres"
