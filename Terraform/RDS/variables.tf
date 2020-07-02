variable "storage" {
  description = "allocated storage in gb"
  default     = "20"
}

variable "storage_type" {
  description = "type of storage: either standard gp2 or io1 provisioned"
  default     = "gp2"
}

variable "engine" {
  description = "database engine being used"
  default     = "mysql"
}

variable "engine_version" {
  description = "version of the chosen engine"
  default     = "5.7"
}

variable "instance_class" {
  description = "instance type of the RDS instance"
  default     = "db.t2.micro"
}

variable "instance_name" {
  description = "name of the database"
  default     = "mysql_db"
}

variable "username" {
  description = "username for master db user"
  default     = "test"
}

variable "password" {
  description = "password for master db user"
  default     = "password"
}

variable "parameter_group" {
  description = "name of the DB parameter group to associate"
  default     = "default.mysql5.7"
}

variable "skip_final_ss" {
  description = "Do you want to skip the final snapshot of the rds instance"
  default     = true
}

variable "vpc_sg_id" {
  default = ""
}

variable "subnetA" {
  default = ""
}

variable "subnetB" {
  default = ""
}