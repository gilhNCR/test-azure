# Resource Group

resource "azurerm_resource_group" "rg" {
    name     = "${var.tags["project"]}-${var.tags["environment"]}"
    location = "${var.location}"

    tags     = {
        environment = "${var.tags["environment"]}"
        project     = "${var.tags["project"]}"
        live        = "${var.tags["live"]}"
        owner       = "${var.tags["owner"]}"
        costcentre  = "${var.tags["costcentre"]}"

    }
}
