terraform {
    required_providers {
        google = {
        source = "hashicorp/google"
        version = "3.5.0"
    }
    }
}

provider "google" {
    credentials = file("C:\\Users\\Giraud-Alexandre\\.ssh\\dsn-dev-01-c54f6a31d417.json")

    project = var.project_id
    region  = var.region
    zone    = "eu-west1-c"
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

resource "google_storage_bucket" "wildfire_dsn" {
  name          = "wildfire_dsn"
  location      = var.region
  force_destroy = true
  project = var.project_id
  storage_class = "STANDARD"

}

resource "google_bigquery_dataset" "Verbatim_dataset" {
  dataset_id = "Verbatim_dataset"
  friendly_name = "Verbatim"
  description = "This dataset contains sentences and their verbatimes"
  location = var.region
  project = var.project_id
}