output "ads_nic_ids" {
    value = "${module.ads_network_interfaces.nic_id}"
}

output "nsg_app_ids" {
    value = "${module.nsg_application.nsg_id}"
}