output "vm_public_ip" {
  value = google_compute_instance.devop_vm_1.network_interface[0].access_config[0].nat_ip
}
