resource "google_service_account" "gke_sa" {
    account_id   = "gke-sa-dev01"
    display_name = "Service Account representing the cluster GKE"
}

resource "google_project_iam_member" "gke_sa_rights" {
    project = var.project_id
    role    = "roles/editor"
    member  = "serviceAccount:gke-sa-dev01@dsn-dev-01.iam.gserviceaccount.com"
}

resource "google_container_cluster" "primary" {
    name     = "my-gke-cluster"
    location = "europe-west1"
    remove_default_node_pool = true
    initial_node_count       = 1
    # We can activate the autoscaling form the terrafrom, check the documentation.
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
    name       = "my-node-pool"
    location   = "europe-west1"
    cluster    = google_container_cluster.primary.name
    node_count = 1

    node_config {
        preemptible  = true
        machine_type = "e2-medium"

        service_account = google_service_account.gke_sa.email
        oauth_scopes    = [
            "https://www.googleapis.com/auth/cloud-platform"
        ]   
    }
}