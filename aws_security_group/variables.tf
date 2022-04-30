variable "name" {
  type             = string
  description      = "Name of Security Group"
}
variable "description" {
  type             = string
  description      = "Created by Terraform"
  default          = null
}
variable "vpc_id" {
  type             = string
  description      = "ID of the AWS VPC"
}
variable "inbound_rules" {
  description      = "List of rules to allow inbound traffic"
  type = map(object({
    protocol      = string
    from_port     = number
    to_port       = number
    cidr_blocks   = list(string)
    description   = string
  }))
  default = {
    description   = null
  }
}

