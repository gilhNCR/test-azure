# Variabes for the load balancer main.tf file

variable "lb_names" {
    description = "Specifies the name of the Load Balancer"
    type        = "list"
}

variable "location" {
    description = "(Required) Specified the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the managed disk."
}

variable "lb_sku" {
    description = "The SKU of the Azure Load Balancer. Accepted values are Basic and Standard. Defaults to Basic."
}



variable "front_lb_ip_name" {
    description = "Specifies the name of the frontend ip configuration"
}

variable "front_subnet_id" {
    description = "The ID of the Subnet which should be associated with the IP Configuration"
}

variable "front_ip_alloc" {
    description = "(Optional) The allocation method for the Private IP Address used by this Load Balancer. Possible values as Dynamic and Static."
}

variable "front_ip_addr" {
    description = "(Optional) Private IP Address to assign to the Load Balancer. The last one and first four IPs in any range are reserved and cannot be manually assigned."
}



variable "network_interface_id" {
    description = "The ID of the Network Interface. Changing this forces a new resource to be created."
    type        = "list"
}

variable "lb_id" {
    description = ""
}

variable "back_pool_name" {
    description = "Specifies the name of the Backend Address Pool."
}

variable "nic_ip_name" {
    description = "(Required) The Name of the IP Configuration within the Network Interface which should be connected to the Backend Address Pool. Changing this forces a new resource to be created"
    type        = "list"
}


variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}

