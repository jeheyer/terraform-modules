variable "listener_arn" {
  type        = string
  description = "ARN of HTTPS Listener"
}
variable "additional_cert_arns" {
  type        = list(string)
  description = "List of ARNs for additional certificates"
  default     = []
}
