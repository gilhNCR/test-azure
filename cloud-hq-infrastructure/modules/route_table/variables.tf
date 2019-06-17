# Variables for the Route Table module main.tf file

variable "route_table_names" {
    description = "A list of names for the route tables"
    type        = "list"
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the virtual network."
}

variable "location" {
    description = "(Required) The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "disable_bgp_route_propagation" {
    description = "Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
}

variable "route_names" {
    description = "A list of names for the routes"
    type        = "list"
}

variable "route_prefixes" {
    description = "(Required) The destination CIDR to which the route applies"
    type        = "list"
}

variable "route_nexthop_types" {
    description = " (Required) The type of Azure hop the packet should be sent to"
    type        = "list"
}

variable "subnet_id" {
    description = "(Required) The ID of the Route Table which should be associated with the Subnet. Changing this forces a new resource to be created"
    type        = "list"
}

variable "route_table_id" {
    description = "(Required) The ID of the Route Table which should be associated with the Subnet. Changing this forces a new resource to be created"
    type        = "list"
}

### Tag variables ###

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}