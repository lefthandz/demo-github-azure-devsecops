variable "workload" {
  type = string
}

variable "location" {
  type    = string
  default = "japaneast"
}

variable "staticWebApplocation" {
  type = string
  // 'Central US', 'East US 2', 'East Asia', 'West Europe', 'West US 2'
  default = "East Asia"
}

variable "staticWebAppSku" {
  type = string
  // 'Free', 'Standard'
  default = "Free"
}
