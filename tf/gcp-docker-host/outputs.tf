
output "docker_hostname" {
  value = google_compute_instance.docker_host.name
}

output "docker_external_ip" {
  value = google_compute_address.docker_host_external_ip.address
}

