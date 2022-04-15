variable "project_id" {
  description = "ID of the GCP Project"
  type        = string
}
variable "name" {
  description = "Name for this CloudArmor Policy"
  type        = string
}
variable "rules" {
  description = "List of Rules"
  type = list(object({
    action      = optional(string)
    priority    = number
    ip_ranges   = optional(list(string))
    expr        = optional(string)
    description = optional(string)
  }))
  default = [{
    action      = "allow"
    priority    = 2147483646
    ip_ranges   = ["*"]
    description = "Allow all traffic"
  }]
}
