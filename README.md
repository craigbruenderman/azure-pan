# azure-pan
Palo Alto NGFW in Azure

## Design Models

* vWAN in use?
* Transit vNet model
  * North/South filtering?
    * Dedicated FWs?
  * Filtering towards ExpressRoute?
  * Filtering towards SD-WAN?
  * East/West filtering between vNets?
    * Dedicated FWs?
  * Fitlering between vNet subnets?
  * Remote Access VPN?
* Single or multiple FWs for HA/scale?

## Prerequisites

* Need owner or contributor role
* Minimum 40 IP addresses for NVA
* Private subnet at least /21

## Steps

* Create vWAN
* Create vHub
  * Private addressing
  * Capacity
* Create NGFW service
* 