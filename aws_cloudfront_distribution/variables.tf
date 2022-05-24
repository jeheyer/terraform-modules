variable "enabled" {
  type    = bool
  default = true
}
variable "domain_names" {
  type        = list(string)
  description = "List of alternate domain names to allow to this CloudFront distro"
  default     = null
}
variable "ssl_cert" {
  type        = string
  description = "SSL certificate ARN"
}
variable "error_pages" {
  type = map(object({
    code      = number
    page_path = string
  }))
  default = {}
}
variable "origins" {
  type = map(object({
    dns_name    = optional(string)
    port        = optional(number)
    protocol    = optional(string)
    tls_version = optional(number)
    path        = optional(string)
    bucket_name = optional(string)
  }))
  default = {
    default = {
      protocol    = "https"
      tls_version = 1.2
      port        = 443
      ttls        = [60, 3600, 86400]
    }
  }
}
variable "default_origin" {
  type        = string
  description = "Origin ID for traffic that doesn't match specific path behavior"
}
variable "behaviors" {
  type = list(object({
    #path   = string
    paths           = list(string)
    origin          = string
    allowed_methods = optional(list(string))
    cached_methods  = optional(list(string))
  }))
  default = []
}
variable "block_list" {
  type        = list(string)
  description = "List of Country Codes to block"
  default     = ["IR", "KP"]
}
variable "tls_security_policy" {
  type        = string
  description = "AWS TLS Security Policy for CloudFront distro"
  default     = "TLSv1.2_2021"
}
variable "price_class" {
  type        = string
  description = "Price Class (Edge Locations)"
  default     = "PriceClass_100"
}
variable "ttls" {
  type        = list(string)
  description = "Min, Default, and Max TTLs"
  default     = [60, 3600, 86400]
}
variable "enable_ipv6" {
  type        = bool
  description = "Enable IPv6 support"
  default     = true
}
variable "enable_http2" {
  type        = bool
  description = "Enable HTTP2 support"
  default     = true
}
variable "root_object" {
  type        = string
  description = "root object for S3 buckets (i.e. index.html)"
  default     = "index.html"
}
variable "comment" {
  type    = string
  default = null
}
