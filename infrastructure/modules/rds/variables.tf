variable "vpc_id" {}

variable "private_subnet_ids" {
  type = list(string)
}

variable "project_name" {
  description = "Project name"
  type = string
}

variable "allowed_rds_cidrs" {
  type	= list(string)
  default = ["10.0.0.0/16"]
}

variable "identifier" {
  description = "DB identifier"
  type = string
}

variable "engine" {
  description = "DB engine"
  type = string
}

variable "engine_version" {
  description = "DB version"
  type = string
}

variable "instance_class" {
  description = "DB instance class"
  type = string
}

variable "db_storage" {
  description = "DB storage size"
  type = string
}

variable "db_username" {
  description = "DB username"
  type = string
}

variable "db_password" {
  description = "DB password"
  type = string
}

variable "db_name" {
  description = "DB name"
  type = string
}
