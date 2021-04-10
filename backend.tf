terraform {
  backend "azurerm" {
    resource_group_name  = "fredrikpalmer-rg"
    storage_account_name = "fredrikpalmer"
    container_name       = "tfstate"
    key                  = "container-registry/terraform.tfstate"
  }
}