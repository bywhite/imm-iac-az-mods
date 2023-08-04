
variable "organization" {
  type = string
}

variable "az_policy_prefix" {
  type = string
}

variable "description" {
  type        = string
  default = "az IMC Default Policy"
}

variable "tags" {
  type        = list(map(string))
  description = "user tags to be applied to all policies"
  default     = []
}

variable "imc_admin_password" {
  type = string
}