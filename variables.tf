variable "aws_key_path" {
  default = "/home/usuario/psepulveda-ireland.pem"
}

variable "aws_key_name" {
  default = "psepulveda-ireland"
}

variable "aws_region" {
  description = "Región EC2 para la VPC"
  default     = "eu-west-1"
}

variable "amis" {
  description = "AMIs por region"
  default = {
    eu-west-1 = "ami-0ba1c3ef9156479a2"
  }
}

variable "vpc_cidr" {
  description = "CIDR para toda la VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR para la subred Public"
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR para la subred Private"
  default     = "10.0.1.0/24"
}

