# Variables for the Application Security Group module main.tf file

variable "asg_names" {
    description = "(Required) Specifies the name of the Application Security Group. Changing this forces a new resource to be created."
    type        = "list"
}

variable "location" {
    description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
}
variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}