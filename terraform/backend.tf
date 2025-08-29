terraform {
  backend "azurerm" {
    resource_group_name  = "keycloak"
    storage_account_name = "hylastixstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}