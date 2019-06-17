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

# RMQ VM Variables

variable "rmq_vm_names" {
    description = " (Required) Specifies the name of the Virtual Machine. Changing this forces a new resource to be created."
    type        = "list"
}

variable "rmq_vm_size" {
    description = ""
}

# RMQ VM Storage Image Reference Variables

variable "rmq_publisher" {
    description = ""
    type        = "list"
}

variable "rmq_offer" {
    description = ""
    type        = "list"
}

variable "rmq_sku" {
    description = ""
    "type"      = "list"
}


# RMQ VM Storage OS Disk Variables

variable "rmq_os_disk_name" {
    description = ""
    type        = "list"
}

variable "rmq_create_option" {
    description = ""
    type        = "list"
}

variable "rmq_managed_disk_type" {
    description = ""
    type        = "list"
}

# RMQ VM OS Profile Variables

variable "rmq_computer_name" {
    description = ""
    type        = "list"
}

variable "rmq_admin_username" {
    description = ""
    type        = "list"
}

variable "rmq_admin_password" {
    description = ""
    type        = "list"
}

# OS Profile Windows Config Variables

variable "rmq_timezone" {
    description = "Specifies the time zone of the virtual machine"
    default     = "GMT Standard Time"
}

### RMQ Availability Set variables ###

variable "rmq_aset_names" {
    description = "(Required) Specifies the name of the availability set. Changing this forces a new resource to be created."
    type        = "list"
}

variable "rmq_aset_managed" {
    description = "(Optional) Specifies whether the availability set is managed or not. Possible values are true (to specify aligned) or false (to specify classic). Default is false."
    type        = "list"
}