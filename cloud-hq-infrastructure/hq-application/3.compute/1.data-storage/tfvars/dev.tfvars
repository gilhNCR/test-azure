### Compute / Data-Storage variables for the DEV environment ###

### Tag variables ###

tags = {
    environment = "DEV"
    project     = "HQ"
    live        = "no"
    owner       = "Paul Campbell"
    costcentre  = "PD6727"
}

### Global Resource variables ###

subscription_id               = "6eeb9b88-68e4-4ec7-9566-d16abb5e96f2"

resource_group_name           = "HQ-DEV"

location                      = "northeurope"

### Managed Disk variable ###

# Retail, CDM and DMS disk variables

sql_ret_mdisk_names          = [ "sql-ret-data1", "sql-ret-data2", "sql-ret-logs", "sql-ret-temp" ]

sql_ret_storage_account_type = [ "Standard_LRS", "Standard_LRS", "Standard_LRS", "Standard_LRS" ]

sql_ret_create_option        = [ "Empty", "Empty", "Empty", "Empty" ]

sql_ret_disk_size_gb         = [ "499", "500", "299", "300" ]

# TDM disks variables

sql_tdm_mdisk_names          = [ "sql-tdm-data1", "sql-tdm-data2", "sql-tdm-logs", "sql-tdm-temp" ]

sql_tdm_storage_account_type = [ "Standard_LRS", "Standard_LRS", "Standard_LRS", "Standard_LRS" ]

sql_tdm_create_option        = [ "Empty", "Empty", "Empty", "Empty" ]

sql_tdm_disk_size_gb         = [ "499", "500", "299", "300" ]

# Reporting Warehouse disk variables

sql_rwh_mdisk_names          = [ "sql-rwh-data1", "sql-rwh-data2", "sql-rwh-logs", "sql-rwh-temp" ]

sql_rwh_storage_account_type = [ "Standard_LRS", "Standard_LRS", "Standard_LRS", "Standard_LRS" ]

sql_rwh_create_option        = [ "Empty", "Empty", "Empty", "Empty" ]

sql_rwh_disk_size_gb         = [ "499", "500", "299", "300" ]

### Virtual Machines ###

# SQL VM Variables

tag_role                     = [ "DBRET", "DBTDM", "DBRWH" ]

sql_vm_names                 = [ "HQDEVDBRET01", "HQDEVDBTDM01", "HQDEVDBRWH01" ]

sql_vm_size                  = "Standard_DS1_v2"


sql_publisher                = [ "MicrosoftWindowsServer", "MicrosoftWindowsServer", "MicrosoftWindowsServer"]

sql_offer                    = [ "WindowsServer", "WindowsServer", "WindowsServer" ]

sql_sku                      = [ "2016-Datacenter", "2016-Datacenter", "2016-Datacenter" ]


sql_os_disk_name             = [ "db-ret-os", "db-tdm-os", "db-rwh-os" ]

sql_create_option            = [ "FromImage", "FromImage", "FromImage" ]

sql_managed_disk_type        = [ "Standard_LRS", "Standard_LRS", "Standard_LRS" ]


sql_computer_name            = [ "HQDEVDBRET01", "HQDEVDBTDM01", "HQDEVDBRWH01" ]

sql_admin_username           = [ "lewissardena", "lewissardena", "lewissardena" ]

sql_admin_password           = [ "Lewisadmin1", "Lewisadmin1", "Lewisadmin1" ]

### Availability Set Variables ###

sql_aset_names               = [ "sql-as-1" ]

sql_aset_managed             = [ true ]