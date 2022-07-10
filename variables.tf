variable "deletion_window_in_days" {
  type        = number
  default     = 10
  description = "Duration in days after which the key is deleted after destruction of the resource"
}

variable "enable_key_rotation" {
  type        = bool
  default     = true
  description = "Specifies whether key rotation is enabled"
}

variable "description" {
  type        = string
  default     = ""
  description = "The description of the key as viewed in AWS console"
}

variable "policy" {
  type        = string
  default     = ""
  description = <<-EOT
    A valid KMS policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. 
    In this case, please make sure you use the verbose/specific version of the policy.
  EOT
}

variable "key_usage" {
  type        = string
  default     = "ENCRYPT_DECRYPT"
  description = "Specifies the intended use of the key. Valid values: `ENCRYPT_DECRYPT` or `SIGN_VERIFY`."
  validation {
    condition     = contains(["ENCRYPT_DECRYPT", "SIGN_VERIFY"], var.key_usage)
    error_message = "Valid values for key_usage: `ENCRYPT_DECRYPT` and `SIGN_VERIFY`."
  } 
}

variable "customer_master_key_spec" {
  type        = string
  default     = "SYMMETRIC_DEFAULT"
  description = <<-EOT
    Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. 
    Valid values: `SYMMETRIC_DEFAULT`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECC_NIST_P256`, `ECC_NIST_P384`, `ECC_NIST_P521`, or `ECC_SECG_P256K1`."
  EOT
  validation {
    condition     = contains(["SYMMETRIC_DEFAULT", "RSA_2048", "RSA_3072", "RSA_4096", "ECC_NIST_P256", "ECC_NIST_P384", "ECC_NIST_P521", "ECC_SECG_P256K1"], var.customer_master_key_spec)
    error_message = "Valid values for customer_master_key_spec: `SYMMETRIC_DEFAULT`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECC_NIST_P256`, `ECC_NIST_P384`, `ECC_NIST_P521` and `ECC_SECG_P256K1`."
  }
}

variable "multi_region" {
  type        = bool
  default     = false
  description = "Indicates whether the KMS key is a multi-Region. Valid values: `true` or `false` for single-region key."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Map of tags to assign to KMS resource."
}

