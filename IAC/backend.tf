terraform {
  backend "s3" {
    bucket       = "3-tier-application-terraform-statefile-vamsi"
    key          = "iac/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
