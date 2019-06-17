# Load Balancer

resource "azurerm_lb" "lb" {
    count                = "${length(var.lb_names)}"
    name                 = "${var.tags["project"]}-${var.tags["environment"]}-${var.lb_names[count.index]}"
    location             = "${var.location}"
    resource_group_name  = "${var.resource_group_name}"
    sku                  = "${var.lb_sku}"

    frontend_ip_configuration {
        name                          = "${var.tags["project"]}-${var.tags["environment"]}-${var.front_lb_ip_name}"
        subnet_id                     = "${var.front_subnet_id}"
        private_ip_address_allocation = "${var.front_ip_alloc}"
        private_ip_address            = "${var.front_ip_addr}"
    }

    tags   = {
        environment = "${var.tags["environment"]}"
        project     = "${var.tags["project"]}"
        live        = "${var.tags["live"]}"
        owner       = "${var.tags["owner"]}"
        costcentre  = "${var.tags["costcentre"]}"
    }
}

# Load Balancer Backend Address Pool

resource "azurerm_lb_backend_address_pool" "lb_back_pool" {
  resource_group_name  = "${var.resource_group_name}"
  loadbalancer_id      = "${var.lb_id}"
  name                 = "${var.back_pool_name}"
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_back_pool_assoc" {
  count                   = "${length(var.network_interface_id)}"
  network_interface_id    = "${var.network_interface_id[count.index]}"
  ip_configuration_name   = "${var.nic_ip_name[count.index]}"
  backend_address_pool_id = "${azurerm_lb_backend_address_pool.lb_back_pool.id}"
}