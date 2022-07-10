
# terraform-aws-kms-key

[![WeSupportUkraine](https://raw.githubusercontent.com/Infrastrukturait/WeSupportUkraine/main/banner.svg)](https://github.com/Infrastrukturait/WeSupportUkraine)
## About
Terraform module to provision a [KMS](https://aws.amazon.com/kms/) 🔑.
## License

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

```text
GNU GENERAL PUBLIC LICENSE
Version 3, 29 June 2007

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```
## Authors
- Rafał Masiarek | [website](https://masiarek.pl) | [email](mailto:rafal@masiarek.pl) | [github](https://github.com/rafalmasiarek)
<!-- BEGIN_TF_DOCS -->
## Documentation



### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_customer_master_key_spec"></a> [customer\_master\_key\_spec](#input\_customer\_master\_key\_spec) | Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. <br>Valid values: `SYMMETRIC_DEFAULT`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECC_NIST_P256`, `ECC_NIST_P384`, `ECC_NIST_P521`, or `ECC_SECG_P256K1`." | `string` | `"SYMMETRIC_DEFAULT"` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | Duration in days after which the key is deleted after destruction of the resource | `number` | `10` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the key as viewed in AWS console | `string` | `""` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Specifies whether key rotation is enabled | `bool` | `true` | no |
| <a name="input_key_usage"></a> [key\_usage](#input\_key\_usage) | Specifies the intended use of the key. Valid values: `ENCRYPT_DECRYPT` or `SIGN_VERIFY`. | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="input_multi_region"></a> [multi\_region](#input\_multi\_region) | Indicates whether the KMS key is a multi-Region. Valid values: `true` or `false` for single-region key. | `bool` | `false` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | A valid KMS policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. <br>In this case, please make sure you use the verbose/specific version of the policy. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to assign to KMS resource. | `map(string)` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | Key ARN |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | Key ID |

### Examples

```hcl
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
```
<!-- END_TF_DOCS -->
