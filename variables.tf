variable "project" {
  description = "The project ID"
  type        = string
  default     = ""
  sensitive   = true
}

variable "region" {
  description = "Default region to use"
  type        = string
  default     = ""
  sensitive   = true
}

variable "ip_cidr_range" {
  description = "The IP CIDR range"

  validation {
    condition     = can(cidrnetmask(var.ip_cidr_range))
    error_message = "The value must be a valid CIDR block."
  }

  type      = string
  default   = ""
  sensitive = true
}
