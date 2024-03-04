variable "certificate" {
  type    = map(string)
  default = {}
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "project" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "environment" {
  type = string
}