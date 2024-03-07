variable "certificate" {
  type    = map(string)
  default = {}
}

variable "project_id" {
  default = "terraform-learn-416018"
}

variable "region" {
  default = "europe-west10"
}

variable "zone" {
  default = "europe-west10-a"
}

variable "environment" {
  default = "staging"
}

variable "ip-cidr-range-west" {
  default = "10.10.0.0/28"
}

# kubernetes cluster

variable "gke_cluster_name" {
    default = "gke-cluster"
}

variable "application_name" {
    default = "home-loan-microservice"
    description = "name of the application and the bucket"
}

variable "gke_num_nodes" {
    default = 1
    description = "number of gke nodes"
}

variable "machine_type" {
    default = "e2-micro"
    description = "machine type for gke nodes"
}

variable "pods_per_nodes" {
    default = 50
    description = "maximum number of pods per node"
}

variable "vpc" {
    default = "default"
    description = "vpc for gke cluster"
}

variable "subnet" {
    default = "default"
    description = "subnet for gke cluster"
}

variable "google_container_node_pool_name" {
    default = "primary-nodes"
    description = "name of the node pool"
}

# redis
variable "tier" {
    default = "BASIC"
    description = "tier for redis"
}

variable "memory_size_gb" {
    default = 1
    description = "memory size for redis"
}

variable "memory_storage_name" {
    default = "memory_storage"
    description = "name of the memory storage"
}

# cloud storage
variable "versioning" {
    default = false
    description = "enable versioning for cloud storage"
}
