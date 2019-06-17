# Route Table

resource "azurerm_route_table" "rt" {
    count                         = "${length(var.route_table_names)}"
    name                          = "${var.tags["project"]}-${var.tags["environment"]}-${var.route_table_names[count.index]}"
    resource_group_name           = "${var.resource_group_name}"
    location                      = "${var.location}"
    disable_bgp_route_propagation = "${var.disable_bgp_route_propagation}"


    tags {
        environment = "${var.tags["environment"]}"
        project     = "${var.tags["project"]}"
        live        = "${var.tags["live"]}"
        owner       = "${var.tags["owner"]}"
        costcentre  = "${var.tags["costcentre"]}"
    }
}

# Route

resource "azurerm_route" "route" {
  name                = "${var.route_names[count.index]}"
  resource_group_name = "${var.resource_group_name}"
  route_table_name    = "${azurerm_route_table.rt.name}"
  address_prefix      = "${var.route_prefixes[count.index]}"
  next_hop_type       = "${var.route_nexthop_types[count.index]}"
  count               = "${length(var.route_names)}"
}

# Route Table Association

resource "azurerm_subnet_route_table_association" "rta" {
    subnet_id       = "${var.subnet_id[count.index]}"
    route_table_id  = "${var.route_table_id[count.index]}"
}