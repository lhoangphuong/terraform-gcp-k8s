resource "google_dns_managed_zone" "k8s" {
  name        = "k8s"
  dns_name    = "plh.net."
  description = "Example DNS zone"
}