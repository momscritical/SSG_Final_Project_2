terraform {
  required_version = ">=1.8.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.103.0"
    }
    kubernetes = { 
      source  = "hashicorp/kubernetes" 
      version = "~> 2.16.1" 
    }
    helm = {
      source  = "hashicorp/helm"
    }
    azapi = {
      source = "Azure/azapi"
      version = "1.13.1"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azapi" {
  # Configuration options
}