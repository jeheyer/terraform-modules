variable "names" {
  description = "List of Names"
  type        = list(string)
  default     = ["regional-backend-service"]
}
variable "project_id" {
  type = string
}
variable "region" {
  description = "GCP Region Name"
  type        = string
}
variable "lb_scheme" {
  type    = string
  default = "INTERNAL"
}
variable "name" {
  description = "Name for this backend service"
  type        = string
}
variable "protocol" {
  description = "Protocol for this backend"
  type        = string
  default     = "TCP"
}
variable "named_port" {
  description = "named port for this instance group"
  type        = string
  default     = null
}
variable "backend_timeout" {
  type        = number
  description = "Time in seconds to wait for a response from the backend"
  default     = 30
}
variable "instance_groups" {
  description = "List of instance groups for Backend Services (can be overridden)"
  type        = list(string)
  default     = []
}
variable "instance_groups_zones" {
  description = "List of instance groups for Backend Services (can be overridden)"
  type        = list(string)
  default     = []
}
variable "balancing_mode" {
  type    = string
  default = "UTILIZATION"
}
variable "max_rate_per_instance" {
  type    = number
  default = null
}
variable "max_utilization" {
  type    = number
  default = 0.8
}
variable "port" {
  description = "Port to send traffic to on the backend"
  type        = number
  default     = 443
}
variable "enable_cdn" {
  description = "Enable Cloud CDN"
  type        = bool
  default     = false
}
variable "cdn_cache_mode" {
  description = "If CDN enabled, the Cache Mode to use"
  type        = string
  default     = null
}
variable "healthcheck_name" {
  type        = string
  description = "Name of the Health Check"
}
variable "lb_policy" {
  type        = string
  description = "Load Balancing Algorithm"
  default     = "ROUND_ROBIN"
}
variable "affinity_type" {
  type        = string
  description = "Type of Session Affinity to use for backend"
  default     = "NONE"
}
variable "enable_logging" {
  description = "Log Requests"
  type        = bool
  default     = false
}
variable "log_sample_rate" {
  description = "Percentage of requests to log"
  type        = number
  default     = null
}
