variable "route_table_id" {
  type = string
}
variable "routes" {
  type = list(object({
    destination = string
    target      = string
  }))
  default = []
}
