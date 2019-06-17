# Varables for the Resource Group module main.tf file

variable "location" {
    description = "The location where the resource group should be created"
    default     = "northeurope"
}

### Tag variables ###


variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}


