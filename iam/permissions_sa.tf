resource "google_service_account" "ci_cd_sa" {
    account_id   = "ci-cd-sa-dev01"
    display_name = "Service Account representing the Gitlab CI Runner"
}


resource "google_project_iam_member" "ci_cd_sa_rights" {
    project = var.project_id
    role    = "roles/editor"
    member  = "serviceAccount:ci-cd-sa-dev01@dsn-dev-01.iam.gserviceaccount.com"
} 

resource "google_artifact_registry_repository_iam_member" "viewer-ci-backend" {
    provider = google-beta
    project = var.project_id
    location = "europe-west1"
    repository = "backend-repository"
    role = "roles/viewer"
    member = "serviceAccount:ci-cd-sa-dev01@dsn-dev-01.iam.gserviceaccount.com"
}

resource "google_artifact_registry_repository_iam_member" "viewer-ci-frontend" {
    provider = google-beta
    project = var.project_id
    location = "europe-west1"
    repository = "frontend-repository"
    role = "roles/viewer"
    member = "serviceAccount:ci-cd-sa-dev01@dsn-dev-01.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "clement_rights" {
    project = var.project_id
    role    = "roles/editor"
    member  = "user:clementdarthe@gmail.com"
}

resource "google_project_iam_member" "alex_rights" {
    project = var.project_id
    role    = "roles/editor"
    member  = "user:alexandre.giraud18@gmail.com"
}

resource "google_project_iam_member" "mt_rights" {
    project = var.project_id
    role    = "roles/editor"
    member  = "user:truong.minhtri3007@gmail.com"
}