variable "az_prefix" {
  description = "Name prefix"
  type        = string
  default     = "Final"
}

variable "az_basic" {
  description = "Basic subnet data"
  type = object({
    prefix              = string
    sub_ip_address      = string
    sub_service_endpoints = list(string)
    private_ip          = string
  })

  default = {
    prefix              = "basic"
    sub_ip_address      = "10.1.10.0/24"
    sub_service_endpoints = []
    private_ip          = "10.1.10.10"
  }
  sensitive = true
}

variable "az_svc" {
  description = "Service subnet data"
  type = object({
    prefix              = string
    sub_ip_address      = string
    sub_service_endpoints = list(string)
  })

  default = {
    prefix              = "svc"
    sub_ip_address      = "10.1.11.0/24"
    sub_service_endpoints = ["Microsoft.Storage", "Microsoft.Sql"]
  }
  sensitive = true
}

variable "uname" {
  description = "The username for the local account that will be created on the new VM."
  type        = string
  default     = "azureuser"
  sensitive   = true
}

variable "ssh_public_key" {
  default   = "~/.ssh/final-key.pub"
  sensitive = true
}

variable "vm_size" {
  description = "The specification of the virtual machine"
  type        = string
  default     = "standard_d2as_v4"
}

variable "network_role_name" {
  description = "Role name - Network Contributor"
  type        = string
  default     = "Network Contributor"
}

variable "storage_account_role_name" {
  description = "Role name - Storage Account Contributor"
  type        = string
  default     = "Storage Account Contributor"
}

variable "private_dns_zone_contributor_role_name" {
    type = string
    description = "role name - Private DNS Zone Contributor"
    default = "Private DNS Zone Contributor"
}
variable "dns_zone_contributor_role_name" {
    type = string
    description = "role name - DNS Zone Contributor"
    default = "DNS Zone Contributor"
}