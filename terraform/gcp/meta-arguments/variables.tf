variable "sets" {
  type        = set(string)
  default     = ["ce1", "ce2", "ce3"]
}

variable "maps" {
  type        = map(object({
    vm_size = string
    zone    = string
  }))
  default     = {
    ce1-map = {vm_size = "e2-micro", zone = "europe-west3-a"},
    ce2-map = {vm_size = "e2-small", zone = "europe-west3-b"},
    ce3-map = {vm_size = "e2-medium", zone = "europe-west3-c"},
  }
}

variable "virtual_machines_modules" {
  type        = map(object({
    vm_size = string
    zone    = string
  }))
  default     = {
    ce1-map-m = {vm_size = "e2-micro", zone = "europe-west3-a"},
    ce2-map-m = {vm_size = "e2-small", zone = "europe-west3-b"},
    ce3-map-m = {vm_size = "e2-medium", zone = "europe-west3-c"},
  }
}