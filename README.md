Go check this link to install the Terraform CLI :
    https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/gcp-get-started

If you want to change something, you must change the configuration file so it's adapted to your local environment. 
For now, just change the line  credentials = file("<NAME>.json")
Instead of name, put the path were you stored the service account key file.

Once your configuration is ready, to implement your modifications, you msut run :
- terraform init
- terraform plan
- terraform apply
