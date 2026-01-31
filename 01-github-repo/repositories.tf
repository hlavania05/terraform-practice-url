// will create your repository in Github using the variables defined in terraform.tfvars file
resource "github_repository" "terraform_scripts_repo" {
  name        = var.repo_name
  description = var.repo_desc
  visibility  = "public"
  auto_init   = true
}

// will show the clone url of the created repository
output "terraform_scripts_repo_clone_url" {
  value = github_repository.terraform_scripts_repo.html_url
}



