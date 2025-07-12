variable "target_group" {
  description = "traget group name"
  type = string
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "allowed_vpc_cidrs" {
  description = "Allowed VPC cidrs"
  type  = list(string)
}

variable "project_name" {
  description = "Project name"
  type = string
}

variable "alb_name" {
  description = "Loadbalancer name"
  type = string
}

#variable "alb_sg_id" {
#  description = "Loadbalancer security ID "
#  type = string
#}

variable "autoscaling_name" {
  description = "Autoscaling group name"
  type = string
}

variable "ecs_cluster_name" {
  description = "ECS cluster name"
  type = string
}

variable "public_subnet_ids" {
  description = "Public subnet ID for Loadbalancer"
  type = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet ID for Target group"
  type = list(string)
}

variable "ecs_launch_template_id" {
  description = "ECS launch template ID for ASG"
  type = list
}
