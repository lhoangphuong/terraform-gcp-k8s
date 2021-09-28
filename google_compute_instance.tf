# master-node
resource "google_compute_instance" "master-node" {
  name         = "worker-node-${var.instance_count_master-node}"
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
    name      = "worker-node-${var.instance_count_master-node}"
    terraform = true
  }

  metadata_startup_script = "echo hi > /test.txt"

}

# worker-node
resource "google_compute_instance" "worker-node" {
  name         = "worker-node-${var.instance_count_worker-node}"
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
    name      = "worker-node-${var.instance_count_worker-node}"
    terraform = true
  }

  metadata_startup_script = "echo hi > /test.txt"

}