# Network Security Group

resource "azurerm_network_security_group" "nsg" {
  count               = "${length(var.security_group_names)}"
  name                = "${var.tags["project"]}-${var.tags["environment"]}-${var.security_group_names[count.index]}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  tags   = {
        environment = "${var.tags["environment"]}"
        project     = "${var.tags["project"]}"
        live        = "${var.tags["live"]}"
        owner       = "${var.tags["owner"]}"
        costcentre  = "${var.tags["costcentre"]}"
    }

}


