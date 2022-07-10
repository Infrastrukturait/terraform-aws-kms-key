output "key_id" {
  value       = aws_kms_key.this.key_id
  description = "Key ID"
}

output "key_arn" {
  value       = aws_kms_key.this.arn
  description = "Key ARN"
}
