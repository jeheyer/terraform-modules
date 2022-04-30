resource "google_compute_instance" "default" {
  count        = var.num_instances
  name         = "${var.name}-${count.index + 1}"
  zone         = "${var.region}-${element(lookup(local.zones_list, var.region, ["b", "c", "a"]), count.index)}"
  machine_type = var.machine_type
  boot_disk {
    initialize_params {
      image = "${var.os_project}/${var.os}"
    }
  }
  network_interface {
    network            = var.vpc_network_name
    subnetwork_project = local.network_project_id
    subnetwork         = local.subnet_id
  }
  labels = {
    os           = var.os
    machine_type = var.machine_type
  }
  tags                    = var.network_tags
  metadata_startup_script = var.startup_script
  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }
  allow_stopping_for_update = true
}

locals {
  network_project_id = coalesce(var.network_project_id, var.project_id)
  subnet_id          = "projects/${local.network_project_id}/regions/${var.region}/subnetworks/${var.subnet_name}"
  zones_list = {
    "us-central"   = ["b", "c", "a", "f"]
    "us-east1"     = ["b", "c", "d"]
    "europe-west1" = ["b", "c", "d"]
  }
  nat_interfaces = var.enable_nat_ip == true ? [1] : []
}
