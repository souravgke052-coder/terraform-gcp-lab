resource "google_compute_network" "devop_vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false

}


resource "google_compute_subnetwork" "devop_subnet" {
  name          = var.subnet_name
  region        = var.region
  ip_cidr_range = var.ip_cidr_range
  network       = google_compute_network.devop_vpc.id
}

resource "google_compute_firewall" "ssh" {
  name = "${var.vpc_name}-ssh-firewall"
  network = google_compute_network.devop_vpc.id

  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["ssh"]
}

resource "google_compute_firewall" "http" {
  name = "${var.vpc_name}-http-firewall"
  network = google_compute_network.devop_vpc.id

  allow {
    protocol = "tcp"
    ports = ["80"]
  }
  
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http-server"]
}
