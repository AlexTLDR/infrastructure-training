variable "certificate" {
  type    = map(string)
  default = {}
}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "environment" {
  type = string
}

variable "ip-cidr-range-west" {
  type = string
}

# kubernetes cluster

variable "gke_cluster_name" {
    type = string
}

variable "application_name" {
    type = string
}

variable "gke_num_nodes" {
    type = number
    description = "number of gke nodes"
}

variable "machine_type" {
    type = string
    description = "machine type for gke nodes"
}