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
## master-node
variable "instance_count_master-node" {
  description = "desired number of the master-node"
  default     = 1
}
variable "machine_type_master-node" {
  description = ""
  default     = "e2-medium"
}
variable "image_master-node" {
  description = ""
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}
variable "zone_master-node" {
  description = ""
  default     = "asia-southeast1-a"
}

## worker-node
variable "instance_count_worker-node" {
  description = "desired number of the worker-node"
  default     = 1
}
variable "machine_type_worker-node" {
  description = ""
  default     = "e2-medium"
}
variable "image_worker-node" {
  description = ""
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}
variable "zone_worker-node" {
  description = ""
  default     = "asia-southeast1-a"
}