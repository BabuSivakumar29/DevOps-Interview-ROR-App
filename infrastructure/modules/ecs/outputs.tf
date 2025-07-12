output "ecs_task_definition_arn" {
  description = "ARN of the ECS Task Definition"
  value       = aws_ecs_task_definition.app.arn
}

output "ecs_task_definition_family" {
  description = "Family of the ECS Task Definition"
  value       = aws_ecs_task_definition.app.family
}

output "ecs_task_exec_role" {
  description = "IAM Role used by ECS Task"
  value       = var.ecs_task_exec_role
}

output "container_names" {
  description = "Names of containers defined in ECS Task"
  value       = ["rails_app", "nginx"]
}

output "log_group_name" {
  description = "CloudWatch Log Group name for ECS"
  value       = aws_cloudwatch_log_group.ecs_logs.name
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.main.name
}

output "ecs_cluster_arn" {
  description = "ARN of the ECS cluster"
  value       = aws_ecs_cluster.main.arn
}

output "ecs_service_name" {
  value = aws_ecs_service.app.name
}

output "capacity_provider_name" {
  value = aws_ecs_capacity_provider.ecs_cp.name
}
