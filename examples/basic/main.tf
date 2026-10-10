terraform {
  required_version = ">= 1.7.0"
}

module "compute-aks" {
  source = "../.."

  resource_group_name = "rg-example"
  location            = "eastus"
  tags = {
    environment = "dev"
  }

  aks_clusters = {} # see README Inputs table / upstream module docs for the per-entry schema
}
