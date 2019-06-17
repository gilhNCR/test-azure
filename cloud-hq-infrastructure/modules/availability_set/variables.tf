# Variabes for the Availability Set main.tf file

variable "aset_names" {
    description = "(Required) Specifies the name of the availability set. Changing this forces a new resource to be created"
    type        = "list"
}

variable "location" {
    description = "(Required) Specified the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the managed disk."
}

variable "managed" {
    description = "(Optional) Specifies whether the availability set is managed or not. Possible values are true (to specify aligned) or false (to specify classic). Default is false."
    type        = "list"
}

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}