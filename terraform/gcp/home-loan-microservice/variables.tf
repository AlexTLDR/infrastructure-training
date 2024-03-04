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