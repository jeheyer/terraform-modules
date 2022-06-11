variable "aws_lb_arn" {
  type        = string
  description = "ARN of AWS LB"
}
variable "port" {
  type        = number
  description = "Port number for Listener"
  default     = 80
}
variable "protocol" {
  type        = string
  description = "Protocol for Listener"
  default     = "HTTP"
}
variable "target_group_arn" {
  type        = string
  description = "ARN of Target Group to forward traffic to"
}
variable "default_cert_arn" {
  type        = string
  description = "ARN for default SSL certificate"
  default     = null
}
variable "ssl_policy_name" {
  type        = string
  description = "AWS SSL Policy for HTTPS Listener"
  default     = "ELBSecurityPolicy-FS-1-2-2019-08"
}
