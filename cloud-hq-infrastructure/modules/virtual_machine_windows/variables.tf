# Variabes for the Virtual machine main.tf file

# VM Variables
variable "vm_names" {
    description = " (Required) Specifies the name of the Virtual Machine. Changing this forces a new resource to be created."
    type        = "list"
}

variable "location" {
    description = "(Required) Specified the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the managed disk."
}

variable "network_interface_ids" {
    description = ""
    type        = "list"
    # type = "string"
}

variable "vm_size" {
    description = "(Required) Specifies the size of the Virtual Machine."
}

variable "availability_set_id" {
    description = "(Optional) The ID of the Availability Set in which the Virtual Machine should exist. Changing this forces a new resource to be created"
}

# Storage Image Reference Variables

variable "publisher" {
    description = ""
    type        = "list"
}

variable "offer" {
    description = ""
    type        = "list"
}

variable "sku" {
    description = ""
    "type"      = "list"
}

# Storage OS Disk Variables

variable "os_disk_name" {
    description = ""
    type        = "list"
}

variable "create_option" {
    description = ""
    type        = "list"
}

variable "managed_disk_type" {
    description = ""
    type        = "list"
}

# OS Profile Variables

variable "computer_name" {
    description = ""
    type        = "list"
}

variable "admin_username" {
    description = ""
    type        = "list"
}

variable "admin_password" {
    description = ""
    type        = "list"
}

# OS Profile Windows COnfig Variables

variable "timezone" {
    description = "Specifies the time zone of the virtual machine"
}

# Tag Variables

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}

variable "tag_role" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "list"
}