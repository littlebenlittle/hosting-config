
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

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnetwork_name
  ip_cidr_range = "10.0.0.0/29"
  network       = google_compute_network.net.name
}

resource "google_compute_firewall" "allow-iap" {
  name    = "${var.network_name}-allow-iap"
  network = google_compute_network.net.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = [local.iap_cidr]
}

resource "google_compute_firewall" "allow-internet" {
  name    = "${var.network_name}-allow-internet"
  network = google_compute_network.net.name
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_address" "docker_host_external_ip" {
  name = "docker-host"
  address = var.external_ip
}

resource "google_compute_disk" "docker_host" {
  name  = "docker-host"
  type  = "pd-ssd"
  image = "cos-cloud/cos-stable"
  size  = var.disk_size
}

resource "google_compute_instance" "docker_host" {
  name         = "docker-host"
  machine_type = var.machine_type
  metadata = {
    enable-oslogin = "TRUE"
    user-data      = local.cloud_config
  }
  allow_stopping_for_update = true
  boot_disk {
    source = google_compute_disk.docker_host.id
  }
  network_interface {
    subnetwork = google_compute_subnetwork.subnet.name
    access_config {
      nat_ip = google_compute_address.docker_host_external_ip.address
    }
  }
}

