resource "azurerm_resource_group" "rg-vms" {
 name = "rg-vms" 
 location = local.location
}

resource "azurerm_network_security_group" "sg-vms" {
  name                = "sg-vms"
  location            = azurerm_resource_group.rg-vms.location
  resource_group_name = azurerm_resource_group.rg-vms.name
}

resource "azurerm_virtual_network" "vnet-craig-vms" {
  name                = "vm-network"
  address_space       = ["172.16.250.0/24"]
  location            = azurerm_resource_group.rg-vWAN.location
  resource_group_name = azurerm_resource_group.rg-vms.name

  subnet {
    name = "vm-snet-1"
    address_prefixes = ["172.16.250.0/25"]
  }

  subnet {
    name = "vm-snet-2"
    address_prefixes = ["172.16.250.128/25"]
  }
}

resource "azurerm_virtual_hub_connection" "conn-vm-vnet" {
  name = "conn-vm-vnet"  
  virtual_hub_id = azurerm_virtual_hub.vHub.id
  remote_virtual_network_id = azurerm_virtual_network.vnet-craig-vms.id
}