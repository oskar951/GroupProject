variable "ubuntu-ami" {
  description = "ubuntu ami"
  default     = "ami-089cc16f7f08c4457"
}

variable "instance-type" {
  description = "instance type"
  default     = "t2.micro"

}

variable "pem-key" {
  default = "qadevops"
}

variable "subnet_id" {
  description = "subnet id"
  default     = ""
}

variable "vpc_security_group_ids" {
  default = ""
}

variable "tags" {
  default = ""
}

variable "associate_public_ip_address" {
  default = ""
}

variable "iam_instance_profile" {
  default = ""
}