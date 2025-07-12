output "ecs_instance_role_name" {
  description = "IAM Role name for ECS EC2 instances"
  value       = aws_iam_role.ecs_instance_role.name
}

output "ecs_instance_role_arn" {
  description = "IAM Role ARN for ECS EC2 instances"
  value       = aws_iam_role.ecs_instance_role.arn
}

output "ecs_instance_profile_name" {
  description = "IAM Instance Profile name to attach to EC2"
  value       = aws_iam_instance_profile.ecs_instance_profile.name
}
