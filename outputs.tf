output "resource_group_name" {
  description = "Created resource group name."
  value       = azurerm_resource_group.rg.name
}

output "vm_name" {
  description = "Created VM name."
  value       = azurerm_windows_virtual_machine.vm.name
}

output "public_ip_address" {
  description = "Public IP address for RDP."
  value       = azurerm_public_ip.public_ip.ip_address
}

output "rdp_command" {
  description = "Command to connect to the Windows VM using Remote Desktop."
  value       = "mstsc /v:${azurerm_public_ip.public_ip.ip_address}"
}
