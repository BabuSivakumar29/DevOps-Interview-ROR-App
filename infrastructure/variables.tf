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
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "private_subnet_cidrs" {
  type = list(string)
}

# #################
# RDS
# #################
variable "identifier" {}
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "db_storage" {}
variable "db_username" {}
variable "db_password" {}
variable "db_name" {}

# ##############
# S3
# ##############
variable "s3_bucket_name" {}
