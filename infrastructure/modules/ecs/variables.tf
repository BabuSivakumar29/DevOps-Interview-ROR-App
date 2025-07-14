variable "project_name" {
  description = "Project name"
  type        = string
}

variable "ecs-task-definition" {
  description = "ECS task definition name"
  type        = string
}

variable "ecs_task_exec_role" {
  description = "ECS task definition name"
  type        = string
}

variable "app_image" {
  description = "ECS task definition name"
  type        = string
}

variable "rds_db_name" {
  description = "ECS task definition name"
  type        = string
}

variable "rds_username" {
  description = "ECS task definition name"
  type        = string
}

variable "rds_password" {
  description = "ECS task definition name"
  type        = string
}

variable "rds_hostname" {
  description = "ECS task definition name"
  type        = string
}

variable "rds_port" {
  description = "ECS task definition name"
  type        = string
}

variable "s3_bucket_name" {
  description = "ECS task definition name"
  type        = string
}

variable "s3_region_name" {
  description = "ECS task definition name"
  type        = string
}

variable "lb_endpoint" {
  description = "ECS task definition name"
  type        = string
}

variable "aws_region" {
  description = "ECS task definition name"
  type        = string
}

variable "nginx_image" {
  description = "ECS task definition name"
  type        = string
}

variable "ecs_cp" {
  description = "Capacity provider name"
  type        = string
}

variable "ecs_service_name" {
  description = "ECS service name"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "ECS security group id"
  type        = string
}

variable "ecs_security_group_arn" {
  description = "ECS security group arn"
  type        = string
}

variable "alb_target_group_arn" {
  description = "ALB target group ARN"
  type        = string
}

variable "lb_listener_arn" {
  description = "Listener ARN (used to enforce dependency)"
  type        = string
}

variable "autoscaling_group_arn" {
  description = "ARN of the Auto Scaling Group"
  type        = string
}
