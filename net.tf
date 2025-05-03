resource "azurerm_resource_group" "rg-vWAN" {
  name     = "rg-vWAN"
  location = local.location
}

resource "azurerm_virtual_wan" "vWAN" {
  name                = "pan-vWAN"
  resource_group_name = azurerm_resource_group.rg-vWAN.name
  location            = azurerm_resource_group.rg-vWAN.location
}

resource "azurerm_virtual_hub" "vHub" {
  name                = "vHub-1"
  resource_group_name = azurerm_resource_group.rg-vWAN.name
  location            = azurerm_resource_group.rg-vWAN.location
  virtual_wan_id      = azurerm_virtual_wan.vWAN.id
  address_prefix      = "10.0.100.0/23"
  tags = {
    "hubSaaSPreview" = "true"
  }
}
