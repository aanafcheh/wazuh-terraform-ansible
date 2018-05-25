// Terraform state file stored in Google cloud Storage
terraform {
 backend "gcs" {
   bucket  = "terraform-statefile"
   prefix    = "/terraform.tfstate"
   project = "ali-anafcheh-oalan002"
 }
}

// Google Cloud provider
provider "google" {
  credentials = "${file("/home/alian/.config/gcloud/terraform.json")}"
  project     = "ali-anafcheh-oalan002"
}
