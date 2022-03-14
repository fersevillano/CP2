# Pedimos el provider de azure
# https://registry.terraform.io/providers/hashicorp/azurerm/latest

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.99.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "45a46f14-9c58-4a21-a288-bf1379f4cf14"
  client_id       = "2f97fb65-220c-4bf0-9bdb-7614db2583b9"
  client_secret   = "ysQpEy8pRysZhm4qJAf5l.aAy3G16hk.95"
  tenant_id       = "899789dc-202f-44b4-8472-a6d40f9eb440"
}

# Creamos un grupo de recursos
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

resource "azurerm_resource_group" "rg" {
  name     = "kubernetes_rg"
  location = var.location
  
  tags = {
      enviroment = "CP2"
  }
}

# Creamos una cuenta de almacenamiento
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account

resource "azurerm_storage_account" "stAccount" {
  name                     = "fersevstoragecp2"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "CP2"
  }
}