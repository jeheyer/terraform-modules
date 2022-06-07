variable "rule_name" {
  type = string
}
variable "rule_description" {
  type    = string
  default = "Created by Terraform"
}
variable "vpc_network_name" {
  type = string
}
variable "priority" {
  type    = number
  default = 1000
}
variable "enable_logging" {
  type    = bool
  default = false
}
variable "direction" {
  type    = string
  default = null
}
variable "source_ranges" {
  type    = list(string)
  default = null
}
variable "destination_ranges" {
  type    = list(string)
  default = null
}
variable "source_tags" {
  type    = list(string)
  default = null
}
variable "target_tags" {
  type    = list(string)
  default = null
}
variable "service_accounts" {
  type    = list(string)
  default = null
}
variable "allow" {
  description = "List of protcols and ports (if applicable) to allow"
  type = list(object({
    protocol = string
    ports    = list(string)
  }))
  default = [
    {
      protocol = "all"
      ports    = []
    }
  ]
}
variable "deny" {
  description = "List of protcols and ports (if applicable) to deny"
  type = list(object({
    protocol = string
    ports    = list(string)
  }))
  default = null
}

