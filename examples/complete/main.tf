module "app_prod_kms_label" {
  source   = "cloudposse/label/null"
  version = "v0.25.0"

  namespace  = "app"
  stage      = "prod"
  name       = "prod-kms"
  attributes = ["private"]
  delimiter  = "-"

  tags = {
    "BusinessUnit" = "XYZ",
  }
}


module "app_prod_kms_key" {
  source = "../../"

  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation

  tags                    = module.app_prod_kms_label.tags
}
