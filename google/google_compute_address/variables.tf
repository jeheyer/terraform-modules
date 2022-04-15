variable "num_addresses" {
  description = "Number of IP addresses to generate"
  type        = number
  default     = 1
}
variable "names" {
  description = "Explict names for Address Names"
  type        = list(string)
  default     = []
}
variable "name_prefix" {
  description = "Prefix if creating multiple addresses"
  type        = string
  default     = null
}
variable "descriptions" {
  description = "Address Descriptions"
  type        = list(string)
  default     = []
}
variable "region" {
  description = "GCP region name"
  type        = string
}
variable "subnet_name" {
  description = "For internal addresses, the name of the subnet"
  type        = string
  default     = "default"
}
variable "addresses" {
  description = "IP Addresses (leave empty to generate one)"
  type        = list(string)
  default     = []
}
variable "prefixes" {
  description = "IP Address Prefix list (i.e. 192.168.1.0/24)"
  type        = list(string)
  default     = []
}
variable "address_type" {
  type        = string
  description = "Address type (Internal or External)"
  default     = "EXTERNAL"
}
variable "purpose" {
  description = "Purpose of the address"
  type        = string
  default     = null
}
variable "network_tier" {
  type        = string
  description = "Networking Tier (PREMIUM or STANDARD)"
  default     = "PREMIUM"
}
variable "network_project_id" {
  description = "If shared VPC, the project ID of the host network"
  type        = string
  default     = null
}
