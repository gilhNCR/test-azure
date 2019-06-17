### Compute / Data-Storage variables for the MGMT environment ###

### Tag variables ###

tags = {
    environment = "MGMT"
    project     = "HQ"
    live        = "no"
    owner       = "Paul Campbell"
    costcentre  = "PD6727"
    role        = "ADS"
}

### Global Resource variables ###

subscription_id               = "6eeb9b88-68e4-4ec7-9566-d16abb5e96f2"

resource_group_name           = "HQ-MGMT"

location                      = "northeurope"


### Virtual Machines ###

# ADS VM Variables

ads_vm_names                 = [ "HQMGMTADS01", "HQMGMTADS02" ]

ads_vm_size                  = "Standard_DS1_v2"


ads_publisher                = [ "MicrosoftWindowsServer", "MicrosoftWindowsServer" ]

ads_offer                    = [ "WindowsServer", "WindowsServer" ]

ads_sku                      = [ "2016-Datacenter", "2016-Datacenter" ]


ads_os_disk_name             = [ "ads-pri-os", "ads-sec-os" ]

ads_create_option            = [ "FromImage", "FromImage" ]

ads_managed_disk_type        = [ "Standard_LRS", "Standard_LRS" ]


ads_computer_name            = [ "HQMGMTADS01", "HQMGMTADS02" ]

ads_admin_username           = [ "lewissardena", "lewissardena" ]

ads_admin_password           = [ "Lewisadmin1", "Lewisadmin1" ]

### Availability Set Variables ###

ads_aset_names               = [ "ads-as-1" ]

ads_aset_managed             = [ true ]