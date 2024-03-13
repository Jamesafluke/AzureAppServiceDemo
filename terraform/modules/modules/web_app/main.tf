resource "azurerm_linux_web_app" "web_app" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  tags     = var.tags

  site_config {}
}