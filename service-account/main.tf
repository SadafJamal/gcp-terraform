terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 7.6"
    }
  }
}

provider "google" {
  project = "gcp-terraform-practice-500412"
  region  = "us-central1"
}
resource "google_service_account" "my-service-accoun" {
    account_id = "sa-terraform"
    display_name = "Terraform Service Account"
}