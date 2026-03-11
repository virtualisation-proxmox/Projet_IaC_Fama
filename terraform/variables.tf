variable "proxmox_api_url" {
  type    = string
  default = "https://192.168.1.113:8006/api2/json"
}

variable "proxmox_api_token_id" {
  type    = string
  default = "root@pam!terraformfama"
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
  default   = "9ab13dd0-329d-416b-98ba-05e73a1c8567"
}

variable "target_node" {
  type    = string
  default = "pve"
}
