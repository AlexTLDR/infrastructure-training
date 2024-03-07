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

variable "ip-cidr-range-west" {
  default = "10.10.0.0/28"
}

# kubernetes cluster

variable "gke_cluster_name_staging" {
  default = "gke-staging"
}

variable "gke_cluster_name_production" {
  default = "gke-production"
}

variable "application_name_staging" {
  default     = "home-loan-staging"
  description = "name of the application and the bucket"
}

variable "application_name_production" {
  default     = "home-loan-production"
  description = "name of the application and the bucket"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

variable "machine_type_staging" {
  default     = "e2-micro"
  description = "machine type for gke nodes"
}

variable "machine_type_production" {
  default     = "e2-micro"
  description = "machine type for gke nodes"
}

variable "pods_per_nodes_staging" {
  default = 50
}

variable "pods_per_nodes_production" {
  default = 100
}

# redis
variable "tier" {
  default = "BASIC"
}

variable "memory_storage_name_staging" {
  default = "redis-staging"
}

variable "memory_storage_name_production" {
  default = "redis-production"
}
