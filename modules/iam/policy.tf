## Policy Attachment

resource "aws_iam_role_policy_attachment" "this" {
  #count      = var.create_policy_attachment ? 1 : 0 

  for_each = toset(var.policy_arns)

  role       = var.role_name
  policy_arn = each.value
}

## Policy Creation

resource "aws_iam_policy" "this" {
  count       = var.create_policy ? 1 : 0
  name        = var.policy_name
  description = var.description
  policy      = var.policy_json
}
