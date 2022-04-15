variable "region" {
  description = "Region"
  type        = string
}
variable "name" {
  description = "Name for this Regional URL Map"
  type        = string
  default     = null
}
variable "default_service" {
  description = "ID of the default service or bucket"
  type        = string
  default     = null
}
variable "default_url_redirect" {
  type    = bool
  default = false
}
variable "redirect_response_code" {
  type    = string
  default = "SEE_OTHER"
}
variable "redirect_to_https" {
  description = "Redirect all requests to HTTPS"
  type        = bool
  default     = false
}
variable "strip_query_on_redirect" {
  description = "Ignore Query Parameters when doing Redirect"
  type        = bool
  default     = false
}
variable "backend_prefix" {
  description = "Naming prefix for the backend"
  type        = string
  default     = "backend"
}
variable "backend_services" {
  description = "Map of Backend Services"
  type = map(object({
    hostnames = optional(list(string))
    paths     = optional(list(string))
    port      = number
  }))
  default = {}
}
variable "route_rules" {
  description = "Hostname and Path to Backend Matching"
  type = list(object({
    hostnames = optional(list(string))
    paths     = optional(list(string))
    backend   = string
  }))
  default = []
}
