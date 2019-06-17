# Availability Set

resource  "azurerm_availability_set" "a_set" {
    count               = "${length(var.aset_names)}"
    name                = "${var.tags["project"]}-${var.tags["environment"]}-${var.aset_names[count.index]}"
    resource_group_name = "${var.resource_group_name}"
    location            = "${var.location}"
    managed             = "${var.managed[count.index]}"

    tags   = {
        environment = "${var.tags["environment"]}"
        project     = "${var.tags["project"]}"
        live        = "${var.tags["live"]}"
        owner       = "${var.tags["owner"]}"
        costcentre  = "${var.tags["costcentre"]}"
    }
}
