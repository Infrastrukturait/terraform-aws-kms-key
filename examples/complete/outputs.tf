output "key_id" {
  value       = module.app_prod_kms_key.key_id
}

output "key_arn" {
  value       = module.app_prod_kms_key.key_arn
}
