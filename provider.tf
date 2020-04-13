#### Provider ######

provider "aws" {
  access = var.access_key
  secret = var.secret_key
  region = var.region
}
