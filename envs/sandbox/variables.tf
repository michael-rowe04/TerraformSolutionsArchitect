variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
    validation {
    condition     = contains(["us-east-1","us-east-2"], var.aws_region)
    error_message = "Variable aws_region must be either us-east-1 or us-east-2"
  }
}

variable "deployment_role_arn" {
  description = "IAM role Terraform assumes"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
  default     = "sandbox"
  validation {
    condition     = contains(["sandbox","dev", "qat", "ppd", "prod"], var.env)
    error_message = "Variable env must be one of: dev, prod, qat, ppd."
  }
}

variable "session_name" {
  description = "Name of the session when assuming terraform deployment role"
  type        = string
  default = "tf-sandbox"
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
  default = "816131439405"
}
