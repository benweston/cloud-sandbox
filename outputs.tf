output "project_id" {
  description = "The ID of the Google Cloud project."
  value       = var.project_id
}

output "vpc_network_name" {
  description = "The name of the VPC network."
  value       = google_compute_network.sandbox_vpc.name
}

output "vpc_network_self_link" {
  description = "The self link of the VPC network."
  value       = google_compute_network.sandbox_vpc.self_link
}

output "enabled_apis" {
  description = "List of individually enabled APIs."
  value = [
    google_project_service.cloudresourcemanager.service,
    google_project_service.iam.service,
    google_project_service.serviceusage.service,
    google_project_service.compute.service
  ]
}
