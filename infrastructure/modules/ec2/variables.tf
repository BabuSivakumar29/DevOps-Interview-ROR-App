variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "allowed_vpc_cidrs" {
  description = "Allowed VPC cidrs"
  type  = list(string)
}

variable "ecs_launch_template" {
  description = "Launch template for ECS cluster"
  type = string
}

variable "instance_type" {
  description = "Instance type for LT"
  type = string
}

variable "ecs_instance_profile_name" {
  description = "IAM Instance Profile name to attach to ECS EC2 instances"
  type = string
}
