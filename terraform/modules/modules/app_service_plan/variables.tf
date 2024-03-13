variable "app_service_plan_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "os_type" {
  type = string
  default = "Linux"
}

variable "sku_name" {
  type = string
  default = "P1v2"
}

variable "tags" {
  type = map
  default = {
    terraform = "true"
  }
}