variable "names" {
  type        = list(string)
  description = "Address Names"
  default     = []
}
variable "name_prefix" {
  description = "Prefix if creating multiple addresses"
  type        = string
  default     = null
}
variable "descriptions" {
  type        = list(string)
  description = "Address Descriptions"
  default     = []
}
variable "ip_version" {
  type        = string
  description = "IPv4 or IPv6"
  default     = null
}
variable "address_type" {
  type        = string
  description = "Address type (Internal or External)"
  default     = "EXTERNAL"
}
variable "addresses" {
  type        = list(string)
  description = "IP Addresses (leave empty to generate one)"
  default     = []
}
variable "prefixes" {
  type        = list(string)
  description = "For range of addresses, the prefixes (i.e. 192.168.1.0/24)"
  default     = []
}
variable "purpose" {
  description = "Purpose (only used for VPC Peering and Private Service Connect)"
  type        = string
  default     = null
}
variable "project_id" {
  description = "Project ID of the shared Network (only required for shared VPC network)"
  type        = string
  default     = null
}
variable "vpc_network_name" {
  description = "VPC Network Name of the shared Network (only required for shared VPC network)"
  type        = string
  default     = null
}
