# public IP

resource "azurerm_public_ip" "pip" {
    count                = "${length(var.pip_names)}"
    name                 = "${var.tags["project"]}-${var.tags["environment"]}-${var.lb_names[count.index]}"
    location             = "${var.location}"
    resource_group_name  = "${var.resource_group_name}"
    allocation_method    = "${var.allocation_method}"

    tags   = {
        environment = "${var.tags["environment"]}"
        project     = "${var.tags["project"]}"
        live        = "${var.tags["live"]}"
        owner       = "${var.tags["owner"]}"
        costcentre  = "${var.tags["costcentre"]}"
    }

}