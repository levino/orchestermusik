variable "cloudflare_api_token" {
  description = "Cloudflare API token with Pages permissions"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare Account ID"
  type        = string
}

variable "project_name" {
  description = "Name of the Cloudflare Pages project"
  type        = string
  default     = "orchestermusik"
}

variable "github_repo" {
  description = "GitHub repository in 'owner/repo' format"
  type        = string
  default     = "levino/orchestermusik"
}

variable "production_branch" {
  description = "Branch for production deployments"
  type        = string
  default     = "main"
}
