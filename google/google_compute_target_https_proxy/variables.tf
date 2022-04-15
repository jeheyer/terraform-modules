variable "name" {
  description = "Name for this Target Proxy"
  type        = string
  default     = null
}
variable "urlmap_id" {
  description = "ID of the URL Map"
  type        = string
}
variable "ssl_certificates" {
  description = "List of SSL Certificate Names"
  type        = list(string)
}
variable "ssl_policy_name" {
  description = "Name of the SSL Policy"
  type        = string
  default     = "GCP default"
}
