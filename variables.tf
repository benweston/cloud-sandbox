variable "billing_account" {
  type        = string
  description = "Billing account to use."
  sensitive   = true
}

variable "region" {
  type        = string
  description = "Default Google Cloud Region."
  sensitive   = true
}

variable "zone" {
  type        = string
  description = "Default Google Cloud Zone."
  sensitive   = true
}

variable "project_name" {
  type        = string
  description = "Project name."
  sensitive   = true
}

variable "project_id_prefix" {
  type        = string
  description = "Project ID prefix"
  sensitive   = true
}
