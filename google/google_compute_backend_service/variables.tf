variable "project_id" {
  type = string
}
variable "name" {
  description = "Name for this backend service"
  type        = string
}
variable "type" {
  description = "Backend Type"
  type        = string
  default     = "instance_group"
}
variable "protocol" {
  description = "Protocol for this backend"
  type        = string
  default     = "HTTP"
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
  type = list(string)
}
variable "instance_groups_zones" {
  type = list(string)
}
variable "balancing_mode" {
  type    = string
  default = "UTILIZATION"
}
variable "max_rate_per_instance" {
  type    = number
  default = 250
}
variable "max_utilization" {
  type    = number
  default = 1.0
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
variable "affinity_type" {
  type        = string
  description = "Type of Session Affinity to use for backend"
  default     = "NONE"
}
variable "security_policy" {
  type        = string
  description = "Name of CloudAmor Security Policy to apply to backend"
  default     = null
}
