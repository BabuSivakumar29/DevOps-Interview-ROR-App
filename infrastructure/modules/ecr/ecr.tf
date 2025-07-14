resource "aws_ecr_repository" "ecr_repos" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE" # or "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = var.ecr_repo_name
  }
}
