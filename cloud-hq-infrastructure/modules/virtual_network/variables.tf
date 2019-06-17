# Variables for the Virtual Network module main.tf file

variable "vn_name" {
    description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the virtual network."
}

variable "address_space" {
    description = "(Required) The address space that is used the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
    type        = "list"
}

variable "location" {
    description = "(Required) The location/region where the virtual network is created. Changing this forces a new resource to be created."
}


# variable "dns_servers" {
#     description = "(Optional) List of IP addresses of DNS servers"
# }

### Tag variables ###

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}