terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "satfstate109234"
    container_name       = "tfstate"
    key                  = "AzureAppServiceDemo/dev/web_app/terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

data "terraform_remote_state" "rg" {
  backend = "azurerm"

    config = {
        resource_group_name  = "rg-tfstate"
        storage_account_name = "satfstate109234"
        container_name       = "tfstate"
        key                  = "AzureAppServiceDemo/dev/rg/terraform.tfstate"
    }
}

module "app_service_plan" {
  source = "github.com/Jamesafluke/AzureAppServiceDemo.git//AzureAppServiceDemo/terraform/modules/modules/app_service_plan/"

  app_service_plan_name = asp1
  resource_group_name = data.rg.output.resource_group_name
  location = data.rg.output.location


}