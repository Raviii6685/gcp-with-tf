variable "org_id" {
  type        = string
  description = "Organization ID that owns the seed project"
}

variable "billing_account" {
  type        = string
  description = "Billing account ID (XXXXXX-XXXXXX-XXXXXX)"
}

variable "suffix" {
  type        = string
  description = "Short unique suffix; project IDs and bucket names are globally unique"
}