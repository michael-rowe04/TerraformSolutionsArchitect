#variable "env" {
#  description = "Environment name"
#  type        = string
#  default     = "sandbox"
#  validation {
#    condition     = contains(["sandbox","dev", "qat", "ppd", "prod"], var.env)
#    error_message = "Variable env must be one of: dev, prod, qat, ppd."
#  }
#}

variable "role_name" {
  description = "Role Name"
  type        = string
  default     = ""
}

variable "assume_role_policy" {
  description = "Trust Policy"
  type        = string
  default     = ""
}

variable "description" {
  description = "Description for Role"
  type        = string
  default     = ""
}

variable "policy_arns" {
  description = "Polciy ARN"
  type        = list
  default     = []
}

variable "create_role" {
    type = bool
    default = false
}

variable "create_policy" {
    type = bool
    default = false
}

variable "policy_json" {
    description = "Actual Policy, in JSON format"
    type = string
    default = ""
}

variable "policy_name" {
    description = "Policy Name"
    type = string
    default = ""
}