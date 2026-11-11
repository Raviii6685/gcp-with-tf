resource "google_project" "seed" {
  name                = "prj-tf-seed"
  project_id          = "prj-tf-seed-${var.suffix}"
  org_id              = var.org_id
  billing_account     = var.billing_account
  auto_create_network = false
}

resource "google_project_service" "apis" {
  for_each = toset([
    "storage.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
  ])
  project = google_project.seed.project_id
  service = each.key
}

resource "google_storage_bucket" "tfstate" {
  name                        = "prj-tf-seed-${var.suffix}-tfstate"
  project                     = google_project.seed.project_id
  location                    = "asia-south1"
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_service_account" "terraform" {
  project      = google_project.seed.project_id
  account_id   = "terraform"
  display_name = "Terraform automation"
}

resource "google_storage_bucket_iam_member" "tf_state" {
  bucket = google_storage_bucket.tfstate.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.terraform.email}"
}