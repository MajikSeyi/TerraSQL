module "mysql_flexible_server" {
  source = "../mysql_flexible_server_mod"

  #   flexibleServers_mysql_dev_template_name           = "mysql-dev-template"
  #   virtualNetworks_aiz_tap_network_externalid        = "/subscriptions/eb7e6807-3047-4e59-b917-2448b3e8101a/resourceGroups/aiz-network-template/providers/Microsoft.Network/virtualNetworks/aiz-tap-network"
  #   privateDnsZones_externalid = "/subscriptions/eb7e6807-3047-4e59-b917-2448b3e8101a/resourceGroups/zscalar/providers/Microsoft.Network/privateDnsZones/privatelink.mysql.database.azure.com"
  #   userAssignedIdentities_mysql_template_admin_id_externalid = "/subscriptions/eb7e6807-3047-4e59-b917-2448b3e8101a/resourceGroups/aiz-keyvault-template/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mysql-template-admin-id"
  #   resource_group_name = "my-resource-group"

  resource_group_name                     = var.resource_group_name
  location                                = var.location
  flexibleServers_mysql_dev_name          = var.flexibleServers_mysql_dev_name
  virtualNetworks_resourceid              = var.virtualNetworks_resourceid
  privateDnsZones_resourceid              = var.privateDnsZones_resourceid
  userAssignedIdentities_mysql_resourceid = var.userAssignedIdentities_mysql_resourceid
  userAssignedIdentity_name = var.userAssignedIdentity_name
  # privateDnsZones_name = var.privateDnsZones_name
  address_prefixes = var.address_prefixes
}
