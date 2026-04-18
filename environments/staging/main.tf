provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "vpc" {
  source = "../../modules/vpc"

  region        = var.region
  subnet_name   = var.subnet_name
  vpc_name      = var.vpc_name
  ip_cidr_range = var.ip_cidr_range
}

module "vm" {
  source       = "../../modules/vm"
  zone         = var.zone
  machine_type = var.machine_type
  vm_name      = var.vm_name
  image_name   = var.image_name
  subnet_id    = module.vpc.subnet_id
}
