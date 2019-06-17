# Variabes for the Managed Disk main.tf file

variable "mdisk_names" {
    description = "(Required) Specifies the name of the managed disk. Changing this forces a new resource to be created."
    type        = "list"
}

variable "location" {
    description = "(Required) Specified the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the managed disk."
}

variable "storage_account_type" {
    description = "(Required) The type of storage to use for the managed disk. Allowable values are Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS."
    type        = "list"
}

variable "create_option" {
    description = "(Required) The method to use when creating the managed disk. Possible values include: Import, Empty, Copy and FromImage"
    type        = "list"
}

variable "disk_size_gb" {
    description = "(Optional, Required for a new managed disk) Specifies the size of the managed disk to create in gigabytes."
    type        = "list"
}

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}