gcp_project = "graphic-parsec-327302"
gcp_region  = "asia-southeast1-a"

instance_count_master-node = 1
machine_type_master-node   = "e2-medium"
zone_master-node           = ["asia-southeast1-a", "asia-southeast1-b"]
image_master-node          = "ubuntu-os-cloud/ubuntu-2004-lts"

instance_count_worker-node = 2
machine_type_worker-node   = "e2-medium"
zone_worker-node           = ["asia-southeast1-a", "asia-southeast1-b"]
image_worker-node          = "ubuntu-os-cloud/ubuntu-2004-lts"