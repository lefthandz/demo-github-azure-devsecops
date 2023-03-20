terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.47"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.workload}"
  location = var.location
}

resource "azurerm_static_site" "main" {
  name                = "stapp-${var.workload}"
  location            = var.staticWebApplocation
  resource_group_name = azurerm_resource_group.main.name
  sku_size            = var.staticWebAppSku
}

resource "azurerm_cosmosdb_account" "name" {
  name                = "cosmon-${var.workload}"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  offer_type          = "Standard"

  capabilities {
    name = "EnableServerless"
  }

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}
