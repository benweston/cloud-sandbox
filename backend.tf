/*
terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}
*/

terraform {
  backend "gcs" {
    bucket = "terraform-state-555298"
    prefix = "/env/dev/terraform.tfstate"
  }
}
