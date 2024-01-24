# Terraform Module - AWS Rubrik Cloud Native Archival Location

This module adds an AWS archival location to an AWS account in Rubrik Security Cloud 

## Prerequisites

There are a few services you'll need in order to get this project off the ground:

- [Terraform](https://www.terraform.io/downloads.html) v1.5.6 or greater
- [Rubrik Polaris Provider for Terraform](https://github.com/rubrikinc/terraform-provider-polaris) - provides Terraform functions for Rubrik Security Cloud (Polaris)
- [Install the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) - Needed for Terraform to authenticate with AWS

## Usage

```hcl
# Create an archival location for a specific AWS account with manual variables.

module "polaris-aws-cloud-native-archival-location" {
  source  = "rubrikinc/polaris-cloud-native-archival-location/aws"

  rsc_archive_location_bucket_prefix  = "<customer_name>-rsc"
  rsc_archive_location_name           = "Terraform-created-archive-location"
  rsc_aws_cnp_account_id              = "01234567-89ab-cdef-0123-456789abcdef"
  rsc_credentials                     = "../.creds/customer-service-account.json"
}
```

```hcl
# Create an archival location for a specific AWS account with variables derived from the polaris-aws-cloud-native module.

module "polaris-aws-cloud-native" {
  source  = "rubrikinc/polaris-cloud-native/aws"
  
  aws_account_name                    = "my_aws_account_hosted_exocompute"
  aws_account_id                      = "123456789012"
  aws_regions                         = ["us-west-2","us-east-1"]
  rsc_credentials                     = "../.creds/customer-service-account.json"
  rsc_aws_features                    = [
                                          "CLOUD_NATIVE_PROTECTION",
                                          "RDS_PROTECTION",
                                          "CLOUD_NATIVE_S3_PROTECTION",
                                          "EXOCOMPUTE",
                                          "CLOUD_NATIVE_ARCHIVAL"
                                        ]
}

module "polaris-aws-cloud-native-archival-location" {
  source  = "rubrikinc/polaris-cloud-native-archival-location/aws"

  rsc_archive_location_bucket_prefix  = "<customer_name>-rsc"
  rsc_archive_location_name           = "Terraform-created-archive-location"
  rsc_aws_cnp_account_id              = module.polaris-aws-cloud-native_host.rsc_aws_cnp_account_id
  rsc_credentials                     = "../.creds/customer-service-account.json"
}
```

<!-- BEGIN_TF_DOCS -->


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.5.6 |
| <a name="requirement_polaris"></a> [polaris](#requirement\_polaris) | =0.8.0-beta.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_polaris"></a> [polaris](#provider\_polaris) | 0.8.0-beta.8 |

## Resources

| Name | Type |
|------|------|
| [polaris_aws_archival_location.archival_location](https://registry.terraform.io/providers/rubrikinc/polaris/0.8.0-beta.8/docs/resources/aws_archival_location) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rsc_archive_location_bucket_prefix"></a> [rsc\_archive\_location\_bucket\_prefix](#input\_rsc\_archive\_location\_bucket\_prefix) | Prefix of the bucket names for the archival location in RSC. | `string` | n/a | yes |
| <a name="input_rsc_archive_location_name"></a> [rsc\_archive\_location\_name](#input\_rsc\_archive\_location\_name) | Name of the archive location in RSC. | `string` | n/a | yes |
| <a name="input_rsc_aws_cnp_account_id"></a> [rsc\_aws\_cnp\_account\_id](#input\_rsc\_aws\_cnp\_account\_id) | Polaris account ID for the AWS account hosting Exocompute. | `string` | n/a | yes |
| <a name="input_rsc_credentials"></a> [rsc\_credentials](#input\_rsc\_credentials) | Path to the Rubrik Security Cloud service account file. | `string` | n/a | yes |

## Outputs

No outputs.


<!-- END_TF_DOCS -->