terraform {
  required_version = ">= 1.5.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.102.0"
    }
  }
}

provider "digitalocean" {
  # Authentication is automatically read from DIGITALOCEAN_TOKEN in the environment
}

# ------------------------------------------------------------------------------
# Variables & Dynamic Environment Resolution
# ------------------------------------------------------------------------------
variable "environment" {
  type        = string
  description = "Target environment for the project (Development, Staging, Production)."
  default     = null

  validation {
    condition = var.environment == null || contains([
      "Development",
      "Staging",
      "Production"
    ], var.environment)
    error_message = "Environment must be one of: 'Development', 'Staging', or 'Production'."
  }
}

locals {
  # Canonical DO environment list for tag creation
  environments = toset(["Development", "Staging", "Production"])

  # Map common workspace names to canonical DigitalOcean environment names
  workspace_map = {
    "default"     = "Development"
    "dev"         = "Development"
    "development" = "Development"
    "staging"     = "Staging"
    "stage"       = "Staging"
    "production"  = "Production"
    "prod"        = "Production"
  }

  # Use var.environment if passed; otherwise resolve based on active workspace
  active_environment = coalesce(
    var.environment,
    lookup(local.workspace_map, lower(terraform.workspace), "Development")
  )
}

# ------------------------------------------------------------------------------
# Resources
# ------------------------------------------------------------------------------
resource "digitalocean_tag" "environments" {
  for_each = local.environments
  name     = each.value
}

resource "digitalocean_project" "cloud_sandbox" {
  name        = "cloud-sandbox"
  description = "Ephemeral cloud infrastructure and sandbox environments for experimentation and learning."
  purpose     = "Try it out / Concept or Prototype"
  environment = local.active_environment
}
