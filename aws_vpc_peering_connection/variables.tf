variable "name" {
  description = "Name for the peering connection"
  type        = string
  default     = null
}
variable "account_id" {
  description = "account ID for the local side"
  type        = string
  default     = null
}
variable "vpc_id" {
  description = "VPC ID for the local side"
  type        = string
}
variable "region" {
  description = "AWS region for the local side"
  type        = string
}
variable "peer_vpc_id" {
  description = "VPC ID for the remote side"
  type        = string
}
variable "peer_account_id" {
  description = "Account ID for the remote side"
  type        = string
  default     = null
}
variable "peer_region" {
  description = "Region for the remote side"
  type        = string
  default    = null
}
variable "create_peering" {
  description = "Create this peering connection"
  type        = bool
  default     = true
}
variable "auto_accept" {
  description = "Auto accept peering connection"
  type        = bool
  default     = null
}
