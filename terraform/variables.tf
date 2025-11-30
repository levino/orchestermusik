variable "cloudflare_api_token" {
  description = "Cloudflare API Token mit Pages-Berechtigungen"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare Account ID"
  type        = string
}

variable "project_name" {
  description = "Name des Cloudflare Pages Projekts"
  type        = string
  default     = "orchestermusik"
}

variable "github_repo" {
  description = "GitHub Repository im Format 'owner/repo'"
  type        = string
  default     = "levino/orchestermusik"
}

variable "production_branch" {
  description = "Branch für Production Deployments"
  type        = string
  default     = "main"
}
