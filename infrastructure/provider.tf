terraform {
  required_version = ">= 1.12.0"

  backend "s3" {
    bucket         = "ror-app-tf-file-eu-west-1"
    key            = "ror-app/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "ror-app-tf-file-eu-west-1-lock-table"
  }
}

provider "aws" {
  region = var.aws_region
}
