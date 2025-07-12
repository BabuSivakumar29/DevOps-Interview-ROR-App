output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.ecs_alb.dns_name
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.ecs_alb.arn
}

output "target_group_arn" {
  description = "ARN of the ECS Target Group"
  value       = aws_lb_target_group.ecs_tg.arn
}

output "alb_listener_arn" {
  description = "ARN of the ALB Listener"
  value       = aws_lb_listener.ecs_listener.arn
}

output "autoscaling_group_name" {
  description = "Name of the ECS Auto Scaling Group"
  value       = aws_autoscaling_group.ecs_asg.name
}

output "ecs_security_group_id" {
  description = "The ID of the security group for Loadbalancer"
  value       = aws_security_group.alb_sg.id
}
