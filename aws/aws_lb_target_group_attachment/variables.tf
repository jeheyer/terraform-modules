variable "target_group_arn" {
  type        = string
  description = "ARN of the LB Target Group"
}
variable "target_ids" {
  type        = list(string)
  description = "IDs of the Targets to Register / Attach"
}
