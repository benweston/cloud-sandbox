resource "google_compute_network" "sandbox_vpc" {
  name                    = "demo-public-vpc"
  auto_create_subnetworks = false
  project                 = var.project_id
  mtu                     = 1460
  depends_on              = [google_project_service.compute]
}

resource "google_compute_subnetwork" "sandbox_subnet" {
  name          = "demo-public-subnet"
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = google_compute_network.sandbox_vpc.id
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-from-anywhere"
  network = google_compute_network.sandbox_vpc.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  description   = "Allow SSH traffic"
}
