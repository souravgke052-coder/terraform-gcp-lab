terraform {
  backend "gcs" {
    bucket  = "mymoruki-terraform-state2"
    prefix  = "staging"
  }
}
