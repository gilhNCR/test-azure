# Variables for the Subnet module main.tf file

variable "sn_names" {
    description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
    type        = "list"
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the virtual network."
}

variable "virtual_network_names" {
    description = "(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
    type        = "list"
}

variable "address_prefixes" {
    description = "(Required) The address prefix to use for the subnet."
    type        = "list"
}

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}