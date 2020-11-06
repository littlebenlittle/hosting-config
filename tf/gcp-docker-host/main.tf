
provider "google" {
  version     = "3.34"
  project     = var.project
  region      = var.region
  zone        = var.zone
  credentials = file(var.creds_file)
}

resource "google_compute_network" "net" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

