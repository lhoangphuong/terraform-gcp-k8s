# GCP
variable "gcp_project" {
  description = "Name of the project"
  default     = "graphic-parsec-327302"
}

variable "gcp_region" {
  description = "Name of the region"
  default     = "asia-southeast1-a"
}


# google_compute_instance
variable "machine_type_master-node" {
  description = ""
  default     = "e2-medium"
}

variable "zone_master-node" {
  description = ""
  default     = "asia-southeast1-a"
}

variable "image_master-node" {
  description = ""
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}