# Master-node
resource "google_compute_instance" "master-node" {

  count = var.instance_count_master-node # meta-argument first

  name         = "master-node-${count.index + 1}"
  machine_type = var.machine_type_master-node
  zone         = element(var.zone_master-node, count.index)
  boot_disk {
    initialize_params {
      image = var.image_master-node
    }
  }
  network_interface {
    network = "default"
    access_config {
      // ephemeral public IP
    }
  }
  metadata = {
    name      = "master-node-${count.index + 1}"
    dns_name  = "master-node-${count.index + 1}.${google_dns_managed_zone.k8s.dns_name}"
    terraform = true
  }

  metadata_startup_script = file("files/master_startup_script.sh") # meta-argument last

}

resource "google_dns_record_set" "master-node" {

  count = var.instance_count_master-node # meta-argument first

  name         = "master-node-${count.index + 1}.${google_dns_managed_zone.k8s.dns_name}"
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.k8s.name
  rrdatas      = [google_compute_instance.master-node[count.index].network_interface[0].access_config[0].nat_ip]
}


# Worker-node
resource "google_compute_instance" "worker-node" {

  count = var.instance_count_worker-node # meta-argument first

  name         = "worker-node-${count.index + 1}"
  machine_type = var.machine_type_worker-node
  zone         = element(var.zone_worker-node, count.index)
  boot_disk {
    initialize_params {
      image = var.image_worker-node
    }
  }
  network_interface {
    network = "default"
    access_config {
      // ephemeral public IP
    }
  }
  metadata = {
    name      = "worker-node-${count.index + 1}"
    dns_name  = "worker-node-${count.index + 1}.${google_dns_managed_zone.k8s.dns_name}"
    terraform = true
  }

  metadata_startup_script = file("files/worker_startup_script.sh") # meta-argument last

}

resource "google_dns_record_set" "worker-node" {

  count = var.instance_count_worker-node # meta-argument first

  name         = "worker-node-${count.index + 1}.${google_dns_managed_zone.k8s.dns_name}"
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.k8s.name
  rrdatas      = [google_compute_instance.worker-node[count.index].network_interface[0].access_config[0].nat_ip]
}