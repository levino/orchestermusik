output "pages_project_name" {
  description = "Name of the Cloudflare Pages project"
  value       = cloudflare_pages_project.orchestermusik.name
}

output "pages_project_subdomain" {
  description = "Subdomain of the Cloudflare Pages project"
  value       = cloudflare_pages_project.orchestermusik.subdomain
}

output "pages_project_domains" {
  description = "Domains of the Cloudflare Pages project"
  value       = cloudflare_pages_project.orchestermusik.domains
}
