variable "name" {
  type    = string
  default = "network-firewall"
}
variable "vpc_id" {
  type = string
}
variable "policy_arn" {
  type = string
}
variable "subnet_id" {
  type = string
}
