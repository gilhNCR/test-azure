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

### Managed Disk Variables ###

# Retail, CDM and DMS disk variables

variable "sql_ret_mdisk_names" {
    description = "(Required) Specifies the name of the managed disk. Changing this forces a new resource to be created."
    type        = "list"
}

variable "sql_ret_storage_account_type" {
    description = "(Required) The type of storage to use for the managed disk. Allowable values are Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS."
    type        = "list"
}

variable "sql_ret_create_option" {
    description = "(Required) The method to use when creating the managed disk. Possible values include: Import, Empty, Copy and FromImage"
    type        = "list"
}

variable "sql_ret_disk_size_gb" {
    description = "(Optional, Required for a new managed disk) Specifies the size of the managed disk to create in gigabytes."
    type        = "list"
}

# TDM disk variables

variable "sql_tdm_mdisk_names" {
    description = "(Required) Specifies the name of the managed disk. Changing this forces a new resource to be created."
    type        = "list"
}

variable "sql_tdm_storage_account_type" {
    description = "(Required) The type of storage to use for the managed disk. Allowable values are Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS."
    type        = "list"
}

variable "sql_tdm_create_option" {
    description = "(Required) The method to use when creating the managed disk. Possible values include: Import, Empty, Copy and FromImage"
    type        = "list"
}

variable "sql_tdm_disk_size_gb" {
    description = "(Optional, Required for a new managed disk) Specifies the size of the managed disk to create in gigabytes."
    type        = "list"
}

# Reporting Warehouse disk variables

variable "sql_rwh_mdisk_names" {
    description = "(Required) Specifies the name of the managed disk. Changing this forces a new resource to be created."
    type        = "list"
}

variable "sql_rwh_storage_account_type" {
    description = "(Required) The type of storage to use for the managed disk. Allowable values are Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS."
    type        = "list"
}

variable "sql_rwh_create_option" {
    description = "(Required) The method to use when creating the managed disk. Possible values include: Import, Empty, Copy and FromImage"
    type        = "list"
}

variable "sql_rwh_disk_size_gb" {
    description = "(Optional, Required for a new managed disk) Specifies the size of the managed disk to create in gigabytes."
    type        = "list"
}

### Virtual Machine Variabes ###

# SQL VM Variables

variable "sql_vm_names" {
    description = " (Required) Specifies the name of the Virtual Machine. Changing this forces a new resource to be created."
    type        = "list"
}

variable "sql_vm_size" {
    description = ""
}

# SQL VM Storage Image Reference Variables

variable "sql_publisher" {
    description = ""
    type        = "list"
}

variable "sql_offer" {
    description = ""
    type        = "list"
}

variable "sql_sku" {
    description = ""
    "type"      = "list"
}


# SQL VM Storage OS Disk Variables

variable "sql_os_disk_name" {
    description = ""
    type        = "list"
}

variable "sql_create_option" {
    description = ""
    type        = "list"
}

variable "sql_managed_disk_type" {
    description = ""
    type        = "list"
}

# SQL VM OS Profile Variables

variable "sql_computer_name" {
    description = ""
    type        = "list"
}

variable "sql_admin_username" {
    description = ""
    type        = "list"
}

variable "sql_admin_password" {
    description = ""
    type        = "list"
}

# OS Profile Windows COnfig Variables

variable "sql_timezone" {
    description = "Specifies the time zone of the virtual machine"
    default     = "GMT Standard Time"
}

### SQL Availability Set variables ###

variable "sql_aset_names" {
    description = "(Required) Specifies the name of the availability set. Changing this forces a new resource to be created."
    type        = "list"
}

variable "sql_aset_managed" {
    description = "(Optional) Specifies whether the availability set is managed or not. Possible values are true (to specify aligned) or false (to specify classic). Default is false."
    type        = "list"
}

### Tag variables ###

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}

variable "tag_role" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "list"
}