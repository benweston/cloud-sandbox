terraform {
  required_version = ">= 1.10.0"

  backend "local" {
    path = "./terraform.tfstate"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.12.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = "6.12.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

provider "google-beta" {
  project = var.project
  region  = var.region
}
