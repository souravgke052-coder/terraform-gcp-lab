resource "google_compute_instance" "devop_vm_1" {
  name         = var.vm_name
  zone         = var.zone
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = var.image_name
    }
  }

  network_interface {
    subnetwork = var.subnet_id
    access_config {}
  }

  service_account {
    email  = devon-sa-001@devop-service-project.iam.gserviceaccount.com
    scopes = ["cloud-platform"]
  } 
#  lifecycle {
#    ignore_changes = [
#      metadata,
#      tags,
#      labels
#    ]
#  }
  tags = ["ssh", "http-server"]
}
