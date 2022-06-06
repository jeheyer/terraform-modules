variable "route_table_id" {
  type = string
}
variable "routes" {
  type    = list(string)
  default = []
}
variable "target" {
  type = string
}
