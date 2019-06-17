### Compute / Data-Storage variables for the DEV environment ###

### Tag variables ###

tags = {
    environment = "DEV"
    project     = "HQ"
    live        = "no"
    owner       = "Paul Campbell"
    costcentre  = "PD6727"
    role        = "RAP"
}

### Global Resource variables ###

subscription_id               = "6eeb9b88-68e4-4ec7-9566-d16abb5e96f2"

resource_group_name           = "HQ-DEV"

location                      = "northeurope"

### Virtual Machines ###

# RAP VM Variables

rap_vm_names                 = [ "HQDEVRAPPRI01", "HQDEVRAPSEC01", "HQDEVRAPREP01" ]

rap_vm_size                  = "Standard_DS1_v2"


rap_publisher                = [ "MicrosoftWindowsServer", "MicrosoftWindowsServer", "MicrosoftWindowsServer"]

rap_offer                    = [ "WindowsServer", "WindowsServer", "WindowsServer" ]

rap_sku                      = [ "2016-Datacenter", "2016-Datacenter", "2016-Datacenter" ]


rap_os_disk_name             = [ "rap-pri-os", "rap-sec-os", "rap-rep-os" ]

rap_create_option            = [ "FromImage", "FromImage", "FromImage" ]

rap_managed_disk_type        = [ "Standard_LRS", "Standard_LRS", "Standard_LRS" ]


rap_computer_name            = [ "HQDEVRAPPRI01", "HQDEVRAPSEC01", "HQDEVRAPREP01" ]

rap_admin_username           = [ "lewissardena", "lewissardena", "lewissardena" ]

rap_admin_password           = [ "Lewisadmin1", "Lewisadmin1", "Lewisadmin1" ]

### Availability Set Variables ###

rap_aset_names               = [ "rap-as-1" ]

rap_aset_managed             = [ true ]
