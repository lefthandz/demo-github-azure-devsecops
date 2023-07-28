terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.67.0"
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
  resource_group_name = azurerm_resource_group.main.name
  location            = var.staticWebApplocation
  sku_size            = var.staticWebAppSku
}

resource "azurerm_cosmosdb_account" "name" {
  name                = "cosmon-${var.workload}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
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

resource "azurerm_storage_account" "main" {
  name                     = "st${random_string.func_storage.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_0"
}
