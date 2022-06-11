variable "name" {
  type             = string
}
variable "description" {
  type             = string
  default          = null
}
variable "vpc_id" {
  type             = string
  description      = "ID of the AWS VPC"
}
variable "inbound_rules" {
  description      = "List of rules to allow inbound traffic"
  type = list(object({
    protocol      = optional(string)
    from_port     = optional(number)
    to_port       = number
    cidr_blocks   = list(string)
    description   = optional(string)
  }))
  default = []
}

