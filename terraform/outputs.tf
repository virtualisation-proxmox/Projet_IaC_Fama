output "vm_ips" {
  value = {
    for k, v in proxmox_vm_qemu.vms : k => v.default_ipv4_address
  }
  description = "Les adresses IP des VMs (web et db)"
}
