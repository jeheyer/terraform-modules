variable "credentials_file" {
  type    = string
  default = null
}
variable "project_id" {
  type = string
}
variable "network_project_id" {
  type    = string
  default = null
}
variable "num_instances" {
  type    = number
  default = 1
}
variable "name" {
  type    = string
  default = "terraform-instance"
}
variable "vpc_network_name" {
  type    = string
  default = "default"
}
variable "subnet_name" {
  type    = string
  default = "default"
}
variable "region" {
  type    = string
  default = "us-central1"
}
variable "machine_type" {
  type    = string
  default = "f1-micro"
}
variable "os_project" {
  type    = string
  default = "debian-cloud"
}
variable "os" {
  type    = string
  default = "debian-10"
}
variable "startup_script" {
  type    = string
  default = "echo 'Created with terraform' > /tmp/terraform.txt"
}
variable "network_tags" {
  type    = list(string)
  default = null
}
variable "service_account_email" {
  type    = string
  default = null
}
variable "service_account_scopes" {
  type    = list(string)
  default = ["compute-rw", "storage-rw", "logging-write", "monitoring"]
}
variable "enable_nat_ip" {
  type    = bool
  default = false
}

