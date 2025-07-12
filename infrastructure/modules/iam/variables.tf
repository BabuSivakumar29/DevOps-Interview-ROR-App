variable "ec2-instance-role" {
  description = "EC2 instance role"
  type        = string
}

variable "ec2-instance-profile" {
  description = "ECS instance profile"
  type        = string
}

variable "ecs-task-exec-role" {
  description = "ECS task execution role"
  type        = string
}
