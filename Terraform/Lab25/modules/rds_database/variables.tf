variable "vpc_id" {
    type = string
}

variable "engine" {
  type        = string
}

variable "engine_version" {
  type        = string
}

variable "instance_class" {
  type        = string
}

variable "private_subnet_ids" {
  type = string
}

variable "allocated_storage" {
  type        = number
}

variable "db_username" {
  type        = string
}

variable "db_name" {
  type        = string
}

variable "db_password" {
  type        = string
}

variable "db_instance_name" {
  type        = string
}

variable "parameter_group_name" {
  type        = string
}

variable "skip_final_snapshot" {
  type        = bool
}
