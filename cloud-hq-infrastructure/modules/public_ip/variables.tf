# Variabes for the public IP main.tf file

variable "pip_names" {
    description = "Specifies the name of the Load Balancer"
    type        = "list"
}

variable "location" {
    description = "(Required) Specified the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the managed disk."
}

variable "allocation_method" {
    description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic."
}

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}