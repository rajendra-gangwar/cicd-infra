variable "cidr" {
  type = map(string)
  # default = "10.0.0.0/24"
}

resource "random_string" "random" {
  length           = 5
  special          = true
  override_special = "/@£$"
}

locals {
  name = "onp-${terraform.workspace}-${random_string.random.id}"
}

resource "aws_vpc" "test1" {
  cidr_block       = lookup(var.cidr, terraform.workspace, "13.0.0.0/24")
  instance_tenancy = "default"

  tags = {
    Name        = "onp-${terraform.workspace}"
    environment = "${terraform.workspace}"
    randomstr   = local.name
  }
}