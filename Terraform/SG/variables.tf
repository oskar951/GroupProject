variable "ingress_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22, 8080, 80, 443, 3306, 9966, 4200]
}

variable "name" {
  description = "Security Group name"
  default     = "WebServerSG"

}

variable "vpc_id" {
  default = ""
}

variable "open-internet" {
  description = "open internet CIDR block"
  default     = ["0.0.0.0/0"]
}

variable "outbound-port" {
  default = "0"
}