variable "userAssignedIdentity_name" {
  description = "name of the user-assigned identity"
  type        = string
  # default     = "mysql-template-admin-id"
}



variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "Kenny-RG"
}

variable "location" {
  type        = string
  description = " default location."
  default     = "West US"
}

variable "flexibleServers_mysql_dev_name" {
  description = "Name of the flexible server"
  type        = string
  default     = "mysql-dev-template"
}

variable "virtualNetworks_resourceid" {
  description = "Resource ID of the virtual network"
  type        = string
  default     = "/subscriptions/50c2252e-5826-4532-a280-06590313ce7a/resourceGroups/Kenny-RG/providers/Microsoft.Network/virtualNetworks/Kenny-vnet"
}

variable "privateDnsZones_name" {
  description = "name of the existing private DNS zone"
  type        = string
  # default     = "KennyDNSzone.mysql.database.azure.com"
  default     = "mayordnszone.mysql.database.azure.com"
  
}

variable "privateDnsZones_resourceid" {
  description = "Resource ID of the private DNS zone"
  type        = string
  default     = "/subscriptions/50c2252e-5826-4532-a280-06590313ce7a/resourceGroups/kenny-rg/providers/Microsoft.Network/privateDnsZones/kennydnszone.mysql.database.azure.com"
}

variable "userAssignedIdentities_mysql_resourceid" {
  description = "Resource ID of the user-assigned identity"
  type        = string
  default     = "/subscriptions/50c2252e-5826-4532-a280-06590313ce7a/resourceGroups/Kenny-RG/providers/Microsoft.ManagedIdentity/userAssignedIdentities/kennyuserassigned"
}


variable "address_prefixes" {
  description = "address range"
  type        = list(string)
  default     = ["192.168.2.0/24"]
}