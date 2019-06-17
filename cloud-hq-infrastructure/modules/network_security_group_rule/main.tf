# Network Security Group Rules

resource "azurerm_network_security_rule" "rules" {
    count                       = "${length(var.rule_names)}"
    name                        = "${var.tags["project"]}-${var.tags["environment"]}-${var.rule_names[count.index]}"
    priority                    = "${var.priority[count.index]}"
    direction                   = "${var.direction[count.index]}"
    access                      = "${var.access[count.index]}"
    protocol                    = "${var.protocol[count.index]}"
    source_port_range           = "${var.source_port_range[count.index]}"
    destination_port_range      = "${var.destination_port_range[count.index]}"
    resource_group_name         = "${var.resource_group_name}"
    source_address_prefix       = "${var.source_address_prefix[count.index]}"
    destination_address_prefix  = "${var.destination_address_prefix[count.index]}"
    network_security_group_name = "${var.network_security_group_name[count.index]}"
}
