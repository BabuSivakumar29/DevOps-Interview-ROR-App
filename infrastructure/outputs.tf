output "backend_ecr_url" {
  description = "Backend (Rails app) ECR repository URL"
  value       = module.ecr_backend.ecr_repository_url
}

output "webserver_ecr_url" {
  description = "Webserver (Nginx) ECR repository URL"
  value       = module.ecr_webserver.ecr_repository_url
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.elb.alb_dns_name
}
