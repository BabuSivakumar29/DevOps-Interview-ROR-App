# Creating secrutiy group for ALB
resource "aws_security_group" "alb_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb_target_group" "ecs_tg" {
  name        = var.target_group
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-399"
  }

  tags = {
    Name = "${var.project_name}-tg"
  }
}

resource "aws_lb" "ecs_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnet_ids

  tags = {
    Name = "${var.project_name}-alb"
  }
}

resource "aws_lb_listener" "ecs_listener" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_tg.arn
  }
  depends_on = [aws_lb_target_group.ecs_tg]
}

resource "aws_autoscaling_group" "ecs_asg" {
  name                = var.autoscaling_name
  max_size            = 3
  min_size            = 2
  desired_capacity    = 2
  vpc_zone_identifier = var.private_subnet_ids
  health_check_type   = "EC2"
  launch_template {
    id      = var.ecs_launch_template_id
    version = "$Latest"
  }
  target_group_arns = [aws_lb_target_group.ecs_tg.arn]

  tag {
    key                 = "Name"
    value               = "${var.project_name}-ecs-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonECSCluster"
    value               = var.ecs_cluster_name
    propagate_at_launch = true
  }
  lifecycle {
    create_before_destroy = true
  }
}
