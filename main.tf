resource "aws_kms_key" "this" {
  deletion_window_in_days  = var.deletion_window_in_days
  enable_key_rotation      = var.enable_key_rotation
  policy                   = var.policy
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  multi_region             = var.multi_region
  description              = var.description
  tags                     = var.tags
}

