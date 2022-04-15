variable "name" {
  description = "Name for this Backend Bucket"
  type        = string
  default     = null
}
variable "bucket_name" {
  description = "Name of the GCP Storage Bucket"
  type        = string
}
variable "enable_cdn" {
  type    = bool
  default = false
}
