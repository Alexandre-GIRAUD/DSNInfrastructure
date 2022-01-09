resource "google_artifact_registry_repository" "frontend-repo" {

    provider=google-beta
    location = "europe-west1"
    repository_id = "frontend-repository"
    description = "Docker repository for the frontend image"
    format = "DOCKER"

}

resource "google_artifact_registry_repository" "backend-repo" {

    provider=google-beta
    location = "europe-west1"
    repository_id = "backend-repository"
    description = "Docker repository for the frontend image"
    format = "DOCKER"

}