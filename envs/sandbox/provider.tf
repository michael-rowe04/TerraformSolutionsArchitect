terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn = var.deployment_role_arn
    session_name = var.session_name
  }

  default_tags {
    tags = {
      Environment = var.env
      ManagedBy   = "Terraform"
      CreatedBy   = var.deployment_role_arn
    }
  }
}
