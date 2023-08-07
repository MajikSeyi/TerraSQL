terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "DevOps-Learn"
    storage_account_name = "majikstate"
    container_name = "majikstate"
    key = "terraform.tfstate"
    
  }
}

provider "azurerm" {
  features {}
}