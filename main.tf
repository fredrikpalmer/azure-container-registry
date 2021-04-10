data "azurerm_client_config" "current" {}

locals {
  name_prefix = "${var.org}-${var.project}"
  common_tags = {
    "organization" = var.org
    "team" = var.team
    "project" = var.project
    "environment" = var.env
  }
}

resource "azurerm_resource_group" "acr_rg" {
 name = "${local.name_prefix}-rg" 
 location = var.location

 tags = local.common_tags
}

resource "azurerm_container_registry" "container_registry" {
  name = replace(local.name_prefix, "-", "")
  resource_group_name = azurerm_resource_group.acr_rg.name
  location = var.location
  sku = "Standard"
  admin_enabled = true

  tags = local.common_tags
}