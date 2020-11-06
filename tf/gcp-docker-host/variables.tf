variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "creds_file" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnetwork_name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "hostname" {
  type = string
}

variable "external_ip" {
  type = string
}

variable "disk_size" {
  type = number
  default = 10
}

