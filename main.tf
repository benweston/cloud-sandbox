terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.24.0"
    }
  }
}

provider "google" {
  project = "${var.project_id_prefix}-${random_integer.randomised_suffix.result}"
  region  = var.region
  zone    = var.zone
}

resource "random_integer" "randomised_suffix" {
  min = 100000
  max = 999999
}

module "project-factory" {
  source          = "terraform-google-modules/project-factory/google"
  version         = "18.0.0"
  billing_account = var.billing_account
  name            = var.project_name
  project_id      = "${var.project_id_prefix}-${random_integer.randomised_suffix.result}"
  deletion_policy = "DELETE"

  activate_apis = [
    "compute.googleapis.com",
    "storage.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com"
  ]

}
