variable "ami" {
  type = string
}

variable "public_subnet_ids" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "sg" {
  type = map(any)
}

variable "vpc_id" {
    type = string
}

