terraform {
  backend "s3" {
    bucket         = "terraform-state-sandbox-001"
    key            = "sandbox/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-sandbox-dynamodb"
    encrypt        = true
    assume_role {
      role_arn = "arn:aws:iam::816131439405:role/tf-deployment-sandbox-role"
    }
  }
}
