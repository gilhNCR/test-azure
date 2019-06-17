# Network Interface

resource "azurerm_network_interface" "nic" {
    count                         = "${length(var.nic_names)}"
    name                          = "${var.tags["project"]}-${var.tags["environment"]}-${var.nic_names[count.index]}"
    resource_group_name           = "${var.resource_group_name}"
    location                      = "${var.location}"
    enable_ip_forwarding          = "${var.enable_ip_forwarding[count.index]}"
    enable_accelerated_networking = "${var.enable_accel_net[count.index]}"
    

    tags   = {
        environment = "${var.tags["environment"]}"
        project     = "${var.tags["project"]}"
        live        = "${var.tags["live"]}"
        owner       = "${var.tags["owner"]}"
        costcentre  = "${var.tags["costcentre"]}"
    }
   
   ip_configuration = {
       name                          = "${var.tags["project"]}-${var.tags["environment"]}-ipconfig${count.index}"
       subnet_id                     = "${var.ip_subnet_id[count.index]}"
       private_ip_address_allocation = "${var.ip_alloc_type[count.index]}"
       private_ip_address_version    = "${var.ip_version[count.index]}"
       primary                       = "${var.primary_ip[count.index]}"

   }
}