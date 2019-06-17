### Remote State Variables ###

variable "subscription_id" {
    description = "The subscription id for either pord or non prod"
}

variable "storage_account_name" {
    description = "The storage account name"
}

variable "container_name" {
    description = "The storage container name"
}

variable "key" {
    description = "The key name is the 'folder' the state while be placed into"
}

variable "access_key" {
    description = "The access key required to access the storage account"
}

### Global Resource Variables ###

variable "location" {
    description = "(Required) The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
    description = "(Required) The name of the resource group in which to create the virtual network."
}

# Virtual Machine Variabes

# RAP VM Variables

variable "rap_vm_names" {
    description = " (Required) Specifies the name of the Virtual Machine. Changing this forces a new resource to be created."
    type        = "list"
}

variable "rap_vm_size" {
    description = ""
}

# RAP VM Storage Image Reference Variables

variable "rap_publisher" {
    description = ""
    type        = "list"
}

variable "rap_offer" {
    description = ""
    type        = "list"
}

variable "rap_sku" {
    description = ""
    "type"      = "list"
}


# RAP VM Storage OS Disk Variables

variable "rap_os_disk_name" {
    description = ""
    type        = "list"
}

variable "rap_create_option" {
    description = ""
    type        = "list"
}

variable "rap_managed_disk_type" {
    description = ""
    type        = "list"
}

# SQL VM OS Profile Variables

variable "rap_computer_name" {
    description = ""
    type        = "list"
}

variable "rap_admin_username" {
    description = ""
    type        = "list"
}

variable "rap_admin_password" {
    description = ""
    type        = "list"
}

# OS Profile Windows Config Variables

variable "rap_timezone" {
    description = "Specifies the time zone of the virtual machine"
    default     = "GMT Standard Time"
}

### RAP Availability Set variables ###

variable "rap_aset_names" {
    description = "(Required) Specifies the name of the availability set. Changing this forces a new resource to be created."
    type        = "list"
}

variable "rap_aset_managed" {
    description = "(Optional) Specifies whether the availability set is managed or not. Possible values are true (to specify aligned) or false (to specify classic). Default is false."
    type        = "list"
}

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}