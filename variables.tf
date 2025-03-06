variable "project_name" {
  type        = string
  description = "Project name."
  sensitive   = true
}

variable "project_id_prefix" {
  type        = string
  description = "Project ID prefix."
  sensitive   = true
}

variable "billing_account" {
  type        = string
  description = "Google Cloud billing account."
  sensitive   = true
}

variable "region" {
  type        = string
  description = "Default region to use."
  sensitive   = true
}

variable "zone" {
  type        = string
  description = "Default zone to use."
  sensitive   = true
}
