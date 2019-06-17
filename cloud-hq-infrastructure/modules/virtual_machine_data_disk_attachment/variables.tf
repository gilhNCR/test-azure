# Variables for the Virtual Network Data Disk Attachment module main.tf file

variable "mdisk_id" {
    description = "(Required) The ID of an existing Managed Disk which should be attached. Changing this forces a new resource to be created"
    type        = "list"
}

variable "vm_id" {
    description = "(Required) The ID of the Virtual Machine to which the Data Disk should be attached. Changing this forces a new resource to be created"
}

variable "lun" {
    description = "(Required) The Logical Unit Number of the Data Disk, which needs to be unique within the Virtual Machine. Changing this forces a new resource to be created"
    type        = "list"
}