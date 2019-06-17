# Application Security Group

resource "azurerm_application_security_group" "asg" {
    count               = "${length(var.asg_names)}"
    name                = "${var.tags["project"]}-${var.tags["environment"]}-${var.asg_names[count.index]}"
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