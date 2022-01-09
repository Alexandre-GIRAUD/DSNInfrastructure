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