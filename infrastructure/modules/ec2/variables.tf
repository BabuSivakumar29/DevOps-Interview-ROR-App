variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ecs_security_group_id" {
  description = "Allowing ALB security group"
  type        = string
}

variable "ecs_launch_template" {
  description = "Launch template for ECS cluster"
  type        = string
}

variable "instance_type" {
  description = "Instance type for LT"
  type        = string
}

variable "ec2_instance_profile_name" {
  description = "IAM Instance Profile name to attach to ECS EC2 instances"
  type        = string
}

variable "ecs_cluster_name" {
  description = "ECS cluster name to attach to ECS EC2 instances"
  type        = string
}
