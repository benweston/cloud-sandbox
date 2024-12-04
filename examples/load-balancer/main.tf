terraform {

  backend "local" {
    path = "./terraform.tfstate"
  }
  
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.12.0"
    }
  }
}

provider "google" {
  # Configuration options
}
