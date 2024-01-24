variable "rsc_archive_location_name" {
  type        = string
  description = "Name of the archive location in RSC."  
}

variable "rsc_archive_location_bucket_prefix" {
  type        = string
  description = "Prefix of the bucket names for the archival location in RSC."  
}

variable "rsc_aws_cnp_account_id" {
  type        = string
  description = "Polaris account ID for the AWS account hosting Exocompute."  
}

variable "rsc_credentials" {
  type        = string
  description = "Path to the Rubrik Security Cloud service account file."
}
