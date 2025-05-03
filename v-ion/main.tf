terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "f79d2be0-bb64-4211-a256-3149af5b3614"
  features {}
}

locals {
  location = "East US"
}

resource "azurerm_resource_group" "rg-pan-sdwan" {
  name     = "rg-pan-sdwan"
  location = "East US"
}

data "azurerm_virtual_wan" "vwan" {
  name                = "existing"
  resource_group_name = "existing"
}

output "id" {
  value = data.azurerm_virtual_wan.example.id
}