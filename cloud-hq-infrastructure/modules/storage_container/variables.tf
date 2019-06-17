# Variables for the Storage container module main.tf file

variable "name" {
    description = "The name of the storage container"
}

variable "resource_group_name" {
    description = "The name of the resource group in which to create the storage container"
}

variable "storage_account_name" {
    description = "Specifies the storage account in which to create the storage container"
}

variable "container_access_type" {
    description = "The 'interface' for access the container provides. Can be either blob, container or private. Defaults to private."
}

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}