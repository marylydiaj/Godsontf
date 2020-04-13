#### Provider ######

provider "aws" {
  active = var.access_key
  security = var.secret_key
  region = var.region
}
