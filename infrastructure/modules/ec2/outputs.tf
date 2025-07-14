output "ecs_security_group_id" {
  description = "The ID of the security group for ECS cluster"
  value       = aws_security_group.ecs_sg.id
}

output "ecs_security_group_arn" {
  description = "The ID of the security group for ECS cluster"
  value       = aws_security_group.ecs_sg.arn
}

output "ecs_launch_template_id" {
  description = "The ID of the ECS launch template"
  value       = aws_launch_template.ecs.id
}

output "ecs_ami_id" {
  description = "The ID of the ECS-optimized AMI"
  value       = data.aws_ami.ecs.id
}

output "ecs_launch_template_name" {
  value = aws_launch_template.ecs.name
}
