output "pages_project_name" {
  description = "Name des Cloudflare Pages Projekts"
  value       = cloudflare_pages_project.orchestermusik.name
}

output "pages_project_subdomain" {
  description = "Subdomain des Cloudflare Pages Projekts"
  value       = cloudflare_pages_project.orchestermusik.subdomain
}

output "pages_project_domains" {
  description = "Domains des Cloudflare Pages Projekts"
  value       = cloudflare_pages_project.orchestermusik.domains
}
