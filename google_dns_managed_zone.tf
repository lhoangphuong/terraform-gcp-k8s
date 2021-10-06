data "google_compute_network" "my-network" {
  name = "default"
}

resource "google_dns_managed_zone" "k8s" {
  name        = "k8s"
  dns_name    = "plh.net."
  description = "Example DNS zone"
  visibility  = "private"
  private_visibility_config {
    networks {
      network_url = data.google_compute_network.my-network.id
    }
  }

  force_destroy = true # meta-argument

}