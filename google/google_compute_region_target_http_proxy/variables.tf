variable "region" {
  description = "GCP Region Name"
  type        = string
}
variable "name" {
  description = "Name for this Target Proxy"
  type        = string
  default     = null
}
variable "urlmap_id" {
  description = "ID of the URL Map"
  type        = string
}
