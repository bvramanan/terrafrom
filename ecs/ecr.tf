resource "aws_ecr_repository" "default" {
       name  = "${var.ecr_repo_name}"
  

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "ecrrepo_repo_url" {
 value = "${aws_ecr_repository.ecrrepo.repository_url}"
}
