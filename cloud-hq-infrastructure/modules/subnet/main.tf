# Subnets

resource "azurerm_subnet" "sn" {
    count                = "${length(var.sn_names)}"
    name                 = "${var.tags["project"]}-${var.tags["environment"]}-${var.sn_names[count.index]}"
    resource_group_name  = "${var.resource_group_name}"
    virtual_network_name = "${var.virtual_network_names[count.index]}"
    address_prefix       = "${var.address_prefixes[count.index]}"

}