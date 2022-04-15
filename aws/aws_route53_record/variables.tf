variable "dns_zone_id" {
  description = "Hosted Zone ID of this DNS zone"
  type        = string
}

variable "name" {
  description = "DNS hostname in the zone to add/modify/delete"
  type        = string
}

variable "type" {
  description = "Type of DNS entry to add/modify"
  type        = string
}

variable "records" {
  description = "Type of DNS entry to add/modify"
  type        = list(string)
}

variable "ttl" {
  description = "DNS Time to Live of this entry, in seconds"
  type        = number
  default     = 300
}
