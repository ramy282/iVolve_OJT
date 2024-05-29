# variables.tf

variable "private_subnets" {
  description = "List of private subnet configurations"
  type = list(object({
    cidr_block = string
    availability_zone = string
  }))
  default = [
    { cidr_block = "10.0.2.0/24", availability_zone = "us-east-1a" },
    { cidr_block = "10.0.3.0/24", availability_zone = "us-east-1b" }
  ]
}

