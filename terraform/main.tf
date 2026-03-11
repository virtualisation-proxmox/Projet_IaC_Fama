terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  # Utilisation des variables du fichier variables.tf
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "vms" {
  for_each    = { "web" = 104, "db" = 105 }
  name        = "vm-${each.key}fama"
  vmid        = each.value
  # Utilisation de la variable target_node
  target_node = var.target_node
  clone       = "templatefama" 
  agent       = 1
  os_type     = "cloud-init"
  cores       = 2
  memory      = 2048

  disk {
    slot    = 1
    size    = "20G"
    type    = "scsi"
    storage = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  ciuser     = "ubuntu"
  cipassword = "ubuntu"
  ipconfig0  = "ip=dhcp"
  
  sshkeys    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC00btaEp5Hj9oHjTeCyzhvkfuWcPxSkV9/K8NASnS0WOcEH4MpJ+yXMIc3ENGIEBcJgDt3PfFEQLZ1/flO0XAIUkYS8vExxeOY/3QRvmajxnhn7MzBr8NCtQ2FA8ZQsR6RT+nmuhx7gFXxOxIjXhu4Pq0+YHNFhd4gKSwKa5xc06uW5XcNWSx666ALiuAy1DUO1dYBlG+fpnuKnpKDyu4eDdkFoiZrb9xeIH8MeVmajy8q4DWDA0f/mZk9MNImrFfYlGN2sh5UgZIsdfL+anQ8zzaMoA7/ZWXZigqMWJdu0sfTss8/Nq1euQaQ8eMoOqLKuGKZCbw3d+5bembE33BNfUpmwW194yqZMKZUpMp3byOqbrg/BsRfu5I90NINrJbfsYX1ejWJEyaoCH6IG7oFgV30T1nyISAFFAQ7J60IUruk2gXuv+Zsm9GYv2pIpGql8/pCcM/x034Wfq7FIbawQT/YORoUUNIoKRU+K1FupK1mvbx1Rsx/1WhLU7bDT/rwzrzn/yCh/yyUucR/m75Nv3gacroZSs8JxIyd2hx96MwEz+SYsiLWtQljjGPcg4GCeN5aNna8uHKoyshTkIVUl+SPhsAQZ2WuUeQMornrKIW+WeqSpIJbyQ0WTrRUqRzJQuvXlENv8QK3zkHnnd6HLA2uqdx7j2S+l6LKIkNyJQ== fama@DESKTOP-EAF8H42"
}
