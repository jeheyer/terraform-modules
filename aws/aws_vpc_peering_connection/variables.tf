variable "account_id" {
  description = "account ID for the local side"
  type        = string
  default     = null
}
variable "vpc_id" {
  description = "VPC ID for the local side"
  type        = string
}
variable "peer_vpc_id" {
  description = "VPC ID for the remote side"
  type        = string
}
variable "owner_account_id" {
  description = "Account ID for the remote side"
  type        = string
  default     = null
}
variable "peer_region" {
  description = "Region for the remote side"
  type        = string
}
variable "auto_accept" {
  description = "Auto accept peering connection"
  default     = false
  type        = bool
}
