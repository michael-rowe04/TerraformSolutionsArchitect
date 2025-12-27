variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "env" {
  description = "Environment name (dev, prod, etc)"
  type        = string
}

variable "force_destroy" {
  description = "Allow bucket deletion even if it contains objects"
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Enable S3 versioning"
  type        = bool
  default     = true
}

variable "block_public_access" {
  description = "Block all public access to the bucket"
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "KMS key ARN for bucket encryption (null = AES256)"
  type        = string
  #default     = null
}

variable "bucket_policy_json" {
  description = "Optional bucket policy JSON"
  type        = string
  default     = null
}

variable "tags" {
  description = "Additional tags to apply to the bucket"
  type        = map(string)
  default     = {}
}

variable "lifecycle_rules" {
  description = "Lifecycle rules for the bucket"
  type = list(object({
    id               = string
    enabled          = bool
    prefix           = string
    expiration_days  = number
    transitions = list(object({
      days          = number
      storage_class = string
    }))
  }))
  default = []
}
