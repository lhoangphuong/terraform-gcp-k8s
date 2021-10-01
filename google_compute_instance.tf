# master-node
resource "google_compute_instance" "master-node" {
  name         = "master-node-${count.index}"
  count        = var.instance_count_master-node
  machine_type = var.machine_type_master-node
  zone         = var.zone_master-node

  boot_disk {
    initialize_params {
      image = var.image_master-node
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    name      = "master-node-${count.index}"
    terraform = true
  }

  metadata_startup_script = file("files/master_startup_script.sh")

}

# worker-node
resource "google_compute_instance" "worker-node" {
  name         = "worker-node-${count.index}"
  count        = var.instance_count_worker-node
  machine_type = var.machine_type_worker-node
  zone         = var.zone_worker-node

  boot_disk {
    initialize_params {
      image = var.image_worker-node
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    name      = "worker-node-${count.index}"
    terraform = true
  }

  metadata_startup_script = file("files/worker_startup_script.sh")
}