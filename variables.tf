variable "region" {
  default     = "us-east-1"
  type        = string
  description = "Region of the VPC"
}

variable "cidr_block" {
    type = list(string)
    default = ["10.0.0.0/16", "10.0.1.0/24","10.0.2.0/24"]
}
variable "ami" {
    type = string
    default = "ami-09d3b3274b6c5d4aa"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}
