resource "github_repository" "terraform_scripts_repo" {
    name = "${var.repo_name}"
    description = "${var.repo_desc}"
    visibility = "public"
    auto_init = true
}



