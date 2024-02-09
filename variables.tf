variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg_webapp"
}

variable "service_plan_name" {
  description = "Name of the Azure service plan"
  type        = string
  default     = "sp_java"
}

variable "web_app_name" {
  description = "Name of the Azure Linux web app"
  type        = string
  default     = "helloworld"
}
