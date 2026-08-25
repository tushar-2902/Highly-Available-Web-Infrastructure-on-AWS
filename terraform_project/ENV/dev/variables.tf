variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

# variable "vpc_id" {
#   type = string
# }

variable "instance_name" {
  type = map(object({
     instance_name = string
     
  }))
}
# variable "subnet_id" {
#   type = string
# }