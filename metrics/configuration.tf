terraform {
    required_providers {
        google = {
        source = "hashicorp/google"
        version = "3.5.0"
    }
    }
}

provider "google" {
    credentials = file("C:\\Users\\LENOVO\\Documents\\.ssh\\dsn-dev-01-52cb45ee6e28.json")

    project = var.project_id
    region  = var.region
    zone    = "eu-west1-c"
}

provider "google-beta" {
    credentials = file("C:\\Users\\LENOVO\\Documents\\.ssh\\dsn-dev-01-52cb45ee6e28.json")

    project = var.project_id
    region  = var.region
    zone    = "eu-west1-c"
}

variable "project_id" {
description = "Google Project ID."
type        = string
default = "dsn-dev-01"
}

variable "region" {
description = "Google Cloud region"
type        = string
default     = "europe-west1"
}