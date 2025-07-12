# Creating ECS cluster
resource "aws_ecs_cluster" "main" {
  name = "${var.project_name}-ecs-cluster"
}

# Creating ECS task definition
resource "aws_ecs_task_definition" "app" {
  family                   = var.ecs-task-definition
  network_mode             = "awsvpc"
  requires_compatibilities = ["EC2"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = var.ecs_task_exec_role
  task_role_arn            = var.ecs_task_exec_role

  container_definitions = jsonencode([
    {
      name      = "rails_app"
      image     = var.app_image # e.g., "your-dockerhub-user/rails_app:latest"
      essential = true
      portMappings = [
        {
          containerPort = 3000
          protocol      = "tcp"
        }
      ]
      environment = [
        { name = "RDS_DB_NAME", value = var.rds_db_name },
        { name = "RDS_USERNAME", value = var.rds_username },
        { name = "RDS_PASSWORD", value = var.rds_password },
        { name = "RDS_HOSTNAME", value = var.rds_hostname },
        { name = "RDS_PORT", value = var.rds_port },
        { name = "S3_BUCKET_NAME", value = var.s3_bucket_name },
        { name = "S3_REGION_NAME", value = var.s3_region_name },
        { name = "LB_ENDPOINT", value = var.lb_endpoint },
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.ecs_logs.name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "rails-app"
        }
      }
    },
    {
      name      = "nginx"
      image     = var.nginx_image # e.g., "your-dockerhub-user/webserver:latest"
      essential = false
      portMappings = [
        {
          containerPort = 8080
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.ecs_logs.name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "nginx"
        }
      }
    }
  ])
}

# CloudWatch log group for ECS cluster
resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/${var.project_name}"
  retention_in_days = 7
}

# Creating Capacity provider
resource "aws_ecs_capacity_provider" "ecs_cp" {
  name = var.ecs_cp

  auto_scaling_group_provider {
    auto_scaling_group_arn = var.ecs_security_group_id

    managed_scaling {
      status                    = "ENABLED"
      target_capacity           = 100
      minimum_scaling_step_size = 1
      maximum_scaling_step_size = 100
    }

    managed_termination_protection = "DISABLED"
  }
}

# Attaching capacity providers to ecs service
resource "aws_ecs_cluster_capacity_providers" "attachment" {
  cluster_name       = aws_ecs_cluster.main.name
  capacity_providers = [aws_ecs_capacity_provider.ecs_cp.name]

  default_capacity_provider_strategy {
    capacity_provider = aws_ecs_capacity_provider.ecs_cp.name
    weight            = 1
    base              = 1
  }
}

# Creating ECS service
resource "aws_ecs_service" "app" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  launch_type     = null

  desired_count                      = 2
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [var.ecs_security_group_id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = "nginx"
    container_port   = 8080
  }

  capacity_provider_strategy {
    capacity_provider = aws_ecs_capacity_provider.ecs_cp.name
    weight            = 1
    base              = 1
  }

  enable_ecs_managed_tags = true
  propagate_tags          = "SERVICE"

  depends_on = []
}
