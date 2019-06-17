### Compute / Data-Storage variables for the DEV environment ###

### Tag variables ###

tags = {
    environment = "DEV"
    project     = "HQ"
    live        = "no"
    owner       = "Paul Campbell"
    costcentre  = "PD6727"
    role        = "RMQ"
}

### Global Resource variables ###

subscription_id               = "6eeb9b88-68e4-4ec7-9566-d16abb5e96f2"

resource_group_name           = "HQ-DEV"

location                      = "northeurope"

### Virtual Machines ###

# SQL VM Variables

rmq_vm_names                 = [ "HQDEVRMQUPL01", "HQDEVRMQDNL01", "HQDEVRMQCS01", "HQDEVRMQJMS01" ]

rmq_vm_size                  = "Standard_DS1_v2"


rmq_publisher                = [ "MicrosoftWindowsServer", "MicrosoftWindowsServer", "MicrosoftWindowsServer", "MicrosoftWindowsServer"]

rmq_offer                    = [ "WindowsServer", "WindowsServer", "WindowsServer","WindowsServer"  ]

rmq_sku                      = [ "2016-Datacenter", "2016-Datacenter", "2016-Datacenter", "2016-Datacenter" ]


rmq_os_disk_name             = [ "rmq-upl-os", "rmq-dnl-os", "rmq-cs-os", "rmq-jms-os" ]

rmq_create_option            = [ "FromImage", "FromImage", "FromImage", "FromImage" ]

rmq_managed_disk_type        = [ "Standard_LRS", "Standard_LRS", "Standard_LRS", "Standard_LRS" ]


rmq_computer_name            = [ "HQDEVRMQUPL01", "HQDEVRMQDNL01", "HQDEVRMQCS01", "HQDEVRMQJMS01" ]

rmq_admin_username           = [ "lewissardena", "lewissardena", "lewissardena", "lewissardena" ]

rmq_admin_password           = [ "Lewisadmin1", "Lewisadmin1", "Lewisadmin1", "Lewisadmin1" ]

### Availability Set Variables ###

rmq_aset_names               = [ "rmq-as-1" ]

rmq_aset_managed             = [ true ]