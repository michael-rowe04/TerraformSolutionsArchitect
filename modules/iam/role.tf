resource "aws_iam_role" "this" {
  count = var.create_role ? 1 : 0

  name  = var.role_name
  description = var.description
  assume_role_policy = var.assume_role_policy
}
