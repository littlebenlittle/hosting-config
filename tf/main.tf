module "gcp-docker-host" {
  source          = "./gcp-docker-host"
  project         = var.gcp_project
  region          = var.gcp_compute_region
  zone            = var.gcp_compute_zone
  creds_file      = var.gcp_creds_file
  network_name    = var.gcp_docker_network_name
  subnetwork_name = var.gcp_docker_subnetwork_name
  machine_type    = var.gcp_docker_host_machine_type
  hostname        = var.gcp_docker_host_hostname
  external_ip     = var.gcp_docker_host_external_ip
  disk_size       = var.gcp_docker_host_disk_size
}

