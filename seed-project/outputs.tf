output "seed_project_id" {
  value = google_project.seed.project_id
}

output "state_bucket" {
  value = google_storage_bucket.tfstate.name
}

output "terraform_sa_email" {
  value = google_service_account.terraform.email
}