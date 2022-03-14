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
  name                     = var.storage_account
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "CP2"
  }
}