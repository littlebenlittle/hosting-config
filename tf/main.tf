module "gcp-docker-host" {
  source          = "./gcp-docker-host"
  project         = var.gcp_project
  region          = var.gcp_compute_region
  zone            = var.gcp_compute_zone
  creds_file      = var.gcp_creds_file
  network_name    = var.gcp_docker_network_name
}

