# master-node
resource "google_compute_instance" "master-node" {
  name         = "master-node"
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
    name      = "master-node"
    terraform = true
  }

  metadata_startup_script = "echo hi > /test.txt"

}

# worker-node
resource "google_compute_instance" "worker-node" {
  name         = "worker-node"
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
    name      = "worker-node"
    terraform = true
  }

  metadata_startup_script = "echo hi > /test.txt"

}