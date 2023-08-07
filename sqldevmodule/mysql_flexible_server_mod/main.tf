#*****************************************************************
#*****        Data References
#*****************************************************************
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
  # location = var.location
}

data "azurerm_virtual_network" "virtual-network" {
  name                = "DevOps"
  resource_group_name = data.azurerm_resource_group.resource_group.name
  
}
data "azurerm_subnet" "existingsql-subnet" {
  name                 = "sqlsubnet"
  virtual_network_name = data.azurerm_virtual_network.virtual-network.name
  resource_group_name  = data.azurerm_resource_group.resource_group.name
}

data "azurerm_user_assigned_identity" "userassignedID" {
  name                = var.userAssignedIdentity_name
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

data "azurerm_private_dns_zone" "existing_privatednszone" {
  name                = var.privateDnsZones_name
  resource_group_name = var.resource_group_name
}


data "azurerm_private_dns_zone_virtual_network_link" "privatednszoneVnetlink" {
  name                  = "kennyvnetzone.com"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = var.privateDnsZones_name
}
# Manages the Subnet/delegation
# resource "azurerm_subnet" "sqlsubnet" {
#   name                 = data.azurerm_subnet.existingsql-subnet.name
#   address_prefixes     = var.address_prefixes
#   resource_group_name  = data.azurerm_resource_group.resource_group.name
#   virtual_network_name = data.azurerm_virtual_network.virtual-network.name
#   service_endpoints    = ["Microsoft.Storage"]

#   delegation {
#     name = "fs"

#     service_delegation {
#       name = "Microsoft.DBforMySQL/flexibleServers"
#       actions = [
#         "Microsoft.Network/virtualNetworks/subnets/join/action",
#       ]
#     }
#   }
# }

resource "azurerm_mysql_flexible_server" "mysql_dev_flexible" {
  name                = var.flexibleServers_mysql_dev_name
  location            = var.location
  resource_group_name = var.resource_group_name
  administrator_login    = "kennyshark"
  administrator_password = "Kenny123$"

  delegated_subnet_id = data.azurerm_subnet.existingsql-subnet.id
  private_dns_zone_id = data.azurerm_private_dns_zone.existing_privatednszone.id

  # sku_name            = "B_Standard_B1s"
  sku_name            = "GP_Standard_D2ads_v5"
  version                      = "8.0.21"
  zone                         = "1"
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  storage {
    size_gb = 20
    iops    = 360

  }

  high_availability {
    mode = "SameZone"
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [data.azurerm_user_assigned_identity.userassignedID.id]

  }
}


resource "azurerm_mysql_flexible_server_active_directory_administrator" "mysql_dev_template_ad" {
  server_id = azurerm_mysql_flexible_server.mysql_dev_flexible.id
  identity_id = var.userAssignedIdentities_mysql_resourceid
  login               = "Kenny@ajala.ml"
  object_id   = data.azurerm_client_config.current.client_id
  # object_id   = f1218113-5a9b-4ed7-b2bb-c9e076d14176
  tenant_id   = data.azurerm_client_config.current.tenant_id
  # tenant_id   = "e52b181f-5b06-4055-b775-2b803fd32033
  
  
}
