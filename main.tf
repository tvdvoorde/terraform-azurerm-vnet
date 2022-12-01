terraform {
  required_version = ">= 1.2.0"
  required_providers {
    azurerm = ">= 3.29.0"
  }
}

variable name {}
variable location {}
variable resource_group_name {}
variable githubsha {}

resource "azurerm_virtual_network" "example" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  tags = {
    environment = "production"
    githubsha   = var.githubsha
    modulepath  = path.module
  }
}
