resource "google_project_service" "enable_apis" {
  project = var.project

  for_each = toset([
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com"
  ])

  service                    = each.key
  disable_dependent_services = true

}
