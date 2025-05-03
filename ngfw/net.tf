resource "azurerm_resource_group" "rg-pan-fw" {
  name = "rg-pan-fw"
  location = local.location
}

resource "azurerm_network_security_group" "sg-pan-fw" {
  name = "sg-pan-fw"
  location = azurerm_resource_group.rg-pan-fw.location
  resource_group_name = azurerm_resource_group.rg-pan-fw.name
}

resource "azurerm_virtual_network" "vnet-pan-fw" {
  name = "vnet-pan-fw"
  address_space = ["172.20.0.0/20"] 
  location = azurerm_resource_group.rg-pan-fw.location
  resource_group_name = azurerm_resource_group.rg-pan-fw.name

  subnet {
    name = "snet-pan-fw-mgmt"
    address_prefixes = ["172.20.0.0/21"]
  }

  subnet {
    name = "snet-pan-fw-outside"
    address_prefixes = ["172.20.1.0/24"]
  }

   subnet {
    name = "snet-pan-fw-inside"
    address_prefixes = ["172.20.2.0/24"]
  }
}


# public_ip
# outside LB
# inside LB
# availability set
# VMs


#resource "azurerm_virtual_hub_routing_intent" "routing-intent" {
  #name           = "vWAN-routing-intent"
  #virtual_hub_id = azurerm_virtual_hub.vHub.id

  #routing_policy {
    #name         = "InternetTrafficPolicy"
    #destinations = ["Internet"]
    #next_hop     = azurerm_firewall.example.id
  #}
#}