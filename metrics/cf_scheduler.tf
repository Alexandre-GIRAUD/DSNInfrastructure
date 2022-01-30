resource "google_cloud_scheduler_job" "job" {
    name             = "update-metrics-job"
    description      = "Job running every day to update users metrics"
    schedule         = "0 0 * * *"
    time_zone        = "Europe/Paris"

    retry_config {
        retry_count = 1
    }

    http_target {
        http_method = "POST"
        uri         = "https://europe-west1-dsn-dev-01.cloudfunctions.net/get-users-metrics"
        body        = base64encode("{\"foo\":\"bar\"}")
            
        oidc_token {
            service_account_email = "backend-sa-dev01@dsn-dev-01.iam.gserviceaccount.com"
    }
    }

}