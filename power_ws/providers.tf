terraform {
  required_providers {
    ibm = {
      source = "ibm-cloud/ibm"
    }
  }
}
provider "ibm" {
  region = var.region
}