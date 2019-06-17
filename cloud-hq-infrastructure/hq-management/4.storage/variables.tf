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


### Tag variables ###

variable "tags" {
    description = "resource tags for Environment, Project, Owner and CostCentre"
    type        = "map"
}

### Deployment Storage Container variables

variable "sc_name" {
    description = "(Required) The name of the storage container. Must be unique within the storage service the container is located."
}

variable "container_access_type" {
    description = "Optional) The 'interface' for access the container provides. Can be either blob, container or private. Defaults to private."
}