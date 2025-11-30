resource "cloudflare_pages_project" "orchestermusik" {
  account_id        = var.cloudflare_account_id
  name              = var.project_name
  production_branch = var.production_branch

  source {
    type = "github"

    config {
      owner                         = split("/", var.github_repo)[0]
      repo_name                     = split("/", var.github_repo)[1]
      production_branch             = var.production_branch
      pr_comments_enabled           = true
      deployments_enabled           = false
      production_deployment_enabled = false
      preview_deployment_setting    = "none"
      preview_branch_includes       = []
    }
  }

  deployment_configs {
    production {
      environment_variables = {
        NODE_VERSION = "20"
      }
    }

    preview {
      environment_variables = {
        NODE_VERSION = "20"
      }
    }
  }
}
