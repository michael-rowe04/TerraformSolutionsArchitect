#################################
########### S3 IMPORTS ##########
#################################

import {
    id = "terraform-state-${var.env}-001"
    to   = module.terraform_state_bucket.aws_s3_bucket.this
}
import {
    id = "terraform-state-${var.env}-001"
    to   = module.terraform_state_bucket.aws_s3_bucket_versioning.this
}

import {
    id = "terraform-state-${var.env}-001"
    to   = module.terraform_state_bucket.aws_s3_bucket_server_side_encryption_configuration.this
}

import {
    id = "terraform-state-${var.env}-001"
    to   = module.terraform_state_bucket.aws_s3_bucket_public_access_block.this
}

#################################
######### IAM IMPORTS ###########
#################################

import {
  to   = module.terraform_deployment_role.aws_iam_role.this[0]
  id = "tf-deployment-${var.env}-role"
}

import {
  to   = module.terraform_deployment_role.aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AdministratorAccess"]
  id = "tf-deployment-${var.env}-role/arn:aws:iam::aws:policy/AdministratorAccess"
}

import {
  to   = module.assume_terraform_role_policy.aws_iam_policy.this[0]
  id = "arn:aws:iam::816131439405:policy/assume-terraform-role-sandbox-policy"
}



module "terraform_state_bucket" {
    source      = "../../modules/s3"
    bucket_name = "terraform-state-${var.env}-001"
    env         = var.env
    kms_key_arn = "arn:aws:kms:${var.aws_region}:${var.account_id}:key/82b15ca5-e835-43fa-ba6c-a31113b9415b"
}

module "terraform_deployment_role" {
    source      = "../../modules/iam"
    create_role = true
    #create_policy_attachment = true

    role_name   = "tf-deployment-${var.env}-role"
    description = "Terraform Provider Role used to manage infrastructure via Terraform."
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { AWS = "arn:aws:iam::${var.account_id}:root" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
    policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"] #list of policies to attach
}

module "assume_terraform_role_policy" {
    source      = "../../modules/iam"
    create_policy = true

    policy_name = "assume-terraform-role-${var.env}-policy"
    description = "Policy for CLI user to be able to assume terraform role when doing terraform deploy."
    policy_json = jsonencode({
    Version = "2012-10-17",
    Statement = [
        {
            Sid = "VisualEditor0",
            Effect = "Allow",
            Action = "sts:AssumeRole",
            Resource = "arn:aws:iam::816131439405:role/tf-deployment-sandbox-role"
        }
    ]
}

    )
}