# Virtual Network

resource "azurerm_virtual_network" "vn" {
    name                 = "${var.tags["project"]}-${var.tags["environment"]}-${var.vn_name}"
    resource_group_name  = "${var.resource_group_name}"
    address_space        = ["${var.address_space}"]
    location             = "${var.location}"
    #dns_servers          = ["${split(",", var.dns_servers)}"]
    
    tags                 = {
        environment = "${var.tags["environment"]}"
        project     = "${var.tags["project"]}"
        live        = "${var.tags["live"]}"
        owner       = "${var.tags["owner"]}"
        costcentre  = "${var.tags["costcentre"]}"
    }
}