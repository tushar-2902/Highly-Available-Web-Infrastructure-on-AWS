variable "instance_name" {
  type = map(object({
     instance_name = string
     
  }))
}

variable "subnet_id" {
  type = string
}