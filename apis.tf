resource "google_project_service" "cloudresourcemanager" {
  service                    = "cloudresourcemanager.googleapis.com"
  project                    = var.project_id
  disable_dependent_services = true
  disable_on_destroy         = true
}

resource "google_project_service" "iam" {
  service                    = "iam.googleapis.com"
  project                    = var.project_id
  disable_dependent_services = true
  disable_on_destroy         = true
}

resource "google_project_service" "serviceusage" {
  service                    = "serviceusage.googleapis.com"
  project                    = var.project_id
  disable_dependent_services = true
  disable_on_destroy         = true
}

resource "google_project_service" "compute" {
  service                    = "compute.googleapis.com"
  project                    = var.project_id
  disable_dependent_services = false
  disable_on_destroy         = false
}
