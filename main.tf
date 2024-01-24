resource "polaris_aws_archival_location" "archival_location" {
  account_id     = var.rsc_aws_cnp_account_id
  name           = var.rsc_archive_location_name
  bucket_prefix  = var.rsc_archive_location_bucket_prefix
}