variable "location" {
  description = "Azure region in which to deploy the VM."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group to create."
  type        = string
  default     = "rg-windows-vm"
}

variable "vm_name" {
  description = "Azure VM name."
  type        = string
  default     = "windows-vm"
}

variable "vm_size" {
  description = "Azure VM size."
  type        = string
  default     = "Standard_B1ms"
}

variable "admin_username" {
  description = "Local Windows administrator username."
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "Local Windows administrator password. Supply via TF_VAR_admin_password or a tfvars file excluded from source control."
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.admin_password) >= 12
    error_message = "The admin password must be at least 12 characters long."
  }
}

variable "rdp_source_cidr" {
  description = "CIDR allowed to connect to RDP. Use your current public IP with /32, for example 198.51.100.25/32."
  type        = string

  validation {
    condition     = can(cidrhost(var.rdp_source_cidr, 0))
    error_message = "rdp_source_cidr must be a valid IPv4 or IPv6 CIDR block."
  }
}
