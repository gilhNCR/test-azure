# Variables for the Storage account module main.tf file

variable "name" {
    description = "The name of the Storage account"
}

variable "resource_group_name" {
    description = "The name of the resource group this storage account should belong to"
}

variable "location" {
    description = "Specifies the supported Azure location where the resource exists"
}

variable "account_tier" {
    description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium"
    default     = "Standard"
}

variable "account_replication_type" {
    description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS"
}

### Tag variables ###


variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}