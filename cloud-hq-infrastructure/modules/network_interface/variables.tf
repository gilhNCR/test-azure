# Variabes for the Network Interface main.tf file

variable "nic_names" {
    description = "The name of the network interface cards"
    type        = "list"
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the virtual network."
}

variable "location" {
    description = "(Required) The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "enable_ip_forwarding" {
    description = "(Optional) Enables IP Forwarding on the NIC. Defaults to false"
    type        = "list"
}

variable "enable_accel_net" {
    description = "Optional) Enables Azure Accelerated Networking using SR-IOV. Only certain VM instance sizes are supported."
    type       = "list"
}

variable "ip_subnet_id" {
    description = "(Optional) Reference to a subnet in which this NIC has been created. Required when private_ip_address_version is IPv4."
    type        = "list"
}

variable "ip_alloc_type" {
    description = "(Required) Defines how a private IP address is assigned. Options are Static or Dynamic."
    type        = "list"
}

variable "ip_version" {
    description = "(Optional) The IP Version to use. Possible values are IPv4 or IPv6. Defaults to IPv4."
    type        = "list"
}

variable "primary_ip" {
    description = "(Optional) Is this the Primary Network Interface? If set to true this should be the first ip_configuration in the array."
    type        = "list"
}

### Tag variables ###

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}