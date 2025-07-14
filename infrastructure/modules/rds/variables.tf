variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnets for RDS"
  type        = list(string)
}

variable "allowed_vpc_cidrs" {
  description = "Allowed VPC cidrs"
  type        = list(string)
}

variable "rds_identifier" {
  description = "DB identifier"
  type        = string
}

variable "engine" {
  description = "DB engine"
  type        = string
}

variable "engine_version" {
  description = "DB version"
  type        = string
}

variable "instance_class" {
  description = "DB instance class"
  type        = string
}

variable "rds_storage" {
  description = "DB storage size"
  type        = string
}

variable "rds_username" {
  description = "DB username"
  type        = string
}

variable "rds_password" {
  description = "DB password"
  type        = string
}

variable "rds_db_name" {
  description = "DB name"
  type        = string
}
