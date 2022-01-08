resource "google_service_account" "ci_cd_sa" {
    account_id   = "ci-cd-sa-dev01"
    display_name = "Service Account representing the cluster GKE"
}


resource "google_project_iam_member" "ci_cd_sa_rights" {
    project = var.project_id
    role    = "roles/editor"
    member  = "serviceAccount:ci-cd-sa-dev01@dsn-dev-01.iam.gserviceaccount.com"
} 