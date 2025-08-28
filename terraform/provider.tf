terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.41.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "a6a5b3aa-6e87-4c3b-8626-718daab9f542"
}
