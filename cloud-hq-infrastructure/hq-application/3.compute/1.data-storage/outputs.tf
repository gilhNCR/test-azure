output "ret_mdisk_ids" {
    value = "${module.sql_ret_managed_disks.mdisk_id}"
}

output "tdm_mdisk_ids" {
    value = "${module.sql_tdm_managed_disks.mdisk_id}"
}

output "rwh_mdisk_ids" {
    value = "${module.sql_rwh_managed_disks.mdisk_id}"
}

output "ret_vm_ids" {
    value = "${module.sql_server_vms.vm_id}"
}

output "tdm_vm_ids" {
    value = "${module.sql_server_vms.vm_id}"
}

output "rwh_vm_ids" {
    value = "${module.sql_server_vms.vm_id}"
}

