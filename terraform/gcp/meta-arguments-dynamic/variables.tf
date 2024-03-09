variable "project" {
  description = "The GCP project to deploy resources"
  type        = string
  default     = "terraform-learn-416018"
}

variable "allow_list" {
  type = map(object({
    protocol = string
    ports    = list(string)
  }))

  default = {
    "allow1" = { protocol = "tcp", ports = ["80", "443"] }
    "allow2" = { protocol = "tcp", ports = ["22"] }
    "allow3" = { protocol = "tcp", ports = ["443"] }
  }
}