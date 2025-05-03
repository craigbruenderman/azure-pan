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
