variable "number" {
  type        = number
  description = "Number of Passwords to Generate"
  default     = 1
}

variable "length" {
  type        = number
  description = "Password Length"
  default     = 16
}

variable "use_special_characters" {
  type        = bool
  description = "Use special characters"
  default     = true
}
