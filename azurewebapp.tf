terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.74.0"
    }
  }
}

###If you don't specify provider configuration, TF will use CLI as the default provider
###If you want to use a different provider, you can specify it in the provider block

provider "azurerm" {
  features {}
}

####Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "East US"
}


####Create a service plan. 
####asp => azurerm_service_plan 
resource "azurerm_service_plan" "asp" {
  name                = var.service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name = "P1v3"
}

####Create a web app
####alwebapp=azurerm_linux_web_app
resource "azurerm_linux_web_app" "linux_webapp" {
  name                = var.web_app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id = azurerm_service_plan.asp.id
  public_network_access_enabled = true

  site_config {
    application_stack {
      java_version = 8
      java_server = "JBOSSEAP"
      java_server_version = "7"
      #To list all the available stacks, run az webapp list-runtimes --linux
    }
  }
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "service_plan_name" {
  value = azurerm_service_plan.asp.name
}

output "web_app_name" {
  value = azurerm_linux_web_app.linux_webapp.name
}