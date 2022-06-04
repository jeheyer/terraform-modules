variable "vpc_id" {
  type = string
}
variable "name" {
  type    = string
  default = null
}
variable "routes" {
  type = list(object({
    cidr_block                 = string
    destination_prefix_list_id = string
  }))
  default = []
}
