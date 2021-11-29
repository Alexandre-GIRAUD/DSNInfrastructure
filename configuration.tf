terraform {
    required_providers {
        google = {
        source = "hashicorp/google"
        version = "3.5.0"
    }
    }
}

provider "google" {
    credentials = file("C:\\Users\\LENOVO\\Downloads\\dsn-dev-01-52cb45ee6e28.json")

    project = "dsn-dev-01"
    region  = "eu-west1"
    zone    = "eu-west1-c"
}

resource "google_project_iam_member" "clement_rights" {
    project = "dsn-dev-01"
    role    = "roles/editor"
    member  = "user:clementdarthe@gmail.com"
}

resource "google_project_iam_member" "alex_rights" {
    project = "dsn-dev-01"
    role    = "roles/editor"
    member  = "user:alexandre.giraud18@gmail.com"
}

resource "google_project_iam_member" "mt_rights" {
    project = "dsn-dev-01"
    role    = "roles/editor"
    member  = "user:truong.minhtri3007@gmail.com"
}
