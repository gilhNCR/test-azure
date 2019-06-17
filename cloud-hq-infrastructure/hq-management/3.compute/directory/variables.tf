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

### Virtual Machine Variabes ###

# ADS VM Variables

variable "ads_vm_names" {
    description = " (Required) Specifies the name of the Virtual Machine. Changing this forces a new resource to be created."
    type        = "list"
}

variable "ads_vm_size" {
    description = ""
}

# ADS VM Storage Image Reference Variables

variable "ads_publisher" {
    description = ""
    type        = "list"
}

variable "ads_offer" {
    description = ""
    type        = "list"
}

variable "ads_sku" {
    description = ""
    "type"      = "list"
}


# ADS VM Storage OS Disk Variables

variable "ads_os_disk_name" {
    description = ""
    type        = "list"
}

variable "ads_create_option" {
    description = ""
    type        = "list"
}

variable "ads_managed_disk_type" {
    description = ""
    type        = "list"
}

# ADS VM OS Profile Variables

variable "ads_computer_name" {
    description = ""
    type        = "list"
}

variable "ads_admin_username" {
    description = ""
    type        = "list"
}

variable "ads_admin_password" {
    description = ""
    type        = "list"
}

# OS Profile Windows Config Variables

variable "ads_timezone" {
    description = "Specifies the time zone of the virtual machine"
    default     = "GMT Standard Time"
}

### ADS Availability Set variables ###

variable "ads_aset_names" {
    description = "(Required) Specifies the name of the availability set. Changing this forces a new resource to be created."
    type        = "list"
}

variable "ads_aset_managed" {
    description = "(Optional) Specifies whether the availability set is managed or not. Possible values are true (to specify aligned) or false (to specify classic). Default is false."
    type        = "list"
}

### Tag variables ###

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}
