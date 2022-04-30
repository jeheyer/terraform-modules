variable "name" {
  description = "Name for this URL Map"
  type        = string
  default     = null
}
variable "default_service_id" {
  description = "ID of the default service or bucket"
  type        = string
  default     = null
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
  type = map(object({
    hostnames = optional(list(string))
    paths     = optional(list(string))
    port      = number
  }))
  default = {}
}
variable "backend_buckets" {
  type = map(object({
    hostnames = optional(list(string))
    paths     = optional(list(string))
  }))
  default = {}
}
variable "route_rules" {
  description = "List of rules to route hostnames & paths to different backends"
  type = list(object({
    hostnames = optional(list(string))
    paths     = optional(list(string))
    backend   = string
  }))
  default = []
}

