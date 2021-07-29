
variable "node_count" {
  type    = number
  default = 4
}

variable "ssd_count" {
  type    = number
  default = 5
}

variable "hdd_count" {
  type    = number
  default = 10
}

variable "cluster_name" {
  type    = string
  default = "berat"
}

variable "instance_type" {
  type    = string
  default = "n1-standard-8"
}

variable "gcp_zone" {
  type    = string
  default = "us-central1-a"
}

variable "qumulo_image" {
  type    = string
  default = "https://www.googleapis.com/compute/v1/projects/qumulo-public/global/images/qumulo-3-2-0-1-hybrid-5tb"
}
