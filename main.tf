# Define provider
provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

# Store terraform state as an object in a pre-existing bucket on Google Cloud Storage (GCS)
terraform {
  backend "gcs" {
    bucket = "terraform-plh"
    prefix = "k8s/state"
  }
}

# Output IP
output "internal_ip_master-node" {
  value = google_compute_instance.master-node.*.network_interface.0.network_ip
}

output "external_ip_master-node" {
  value = google_compute_instance.master-node.*.network_interface.0.access_config.0.nat_ip
}

output "instance_id_master-node" {
  value = google_compute_instance.master-node.*.instance_id
}

output "internal_ip_worker-node" {
  value = google_compute_instance.worker-node.*.network_interface.0.network_ip
}

output "external_ip_worker-node" {
  value = google_compute_instance.worker-node.*.network_interface.0.access_config.0.nat_ip
}

output "instance_id_worker-node" {
  value = google_compute_instance.worker-node.*.instance_id
}