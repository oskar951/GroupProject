variable "role" {
    description = "IAM role for lambda functions"
    default = ""
}

variable "snapshot_filename" {
    description = "filename for createSnapshot function"
    default = "../scripts/lambda/createSnapshot.zip"
}

variable "snapshot_function_name" {
    description = "Name of lambda function"
    default = "createSnapshot"
}

variable "snapshot_handler" {
    description = "lambda function handler"
    default = "createSnapshot.lambda_handler"
}

variable "image_filename" {
    description = "filename for createImage function"
    default = "../scripts/lambda/createImage.zip"
}

variable "image_function_name" {
    description = "Name of lambda function"
    default = "createImage"
}

variable "image_handler" {
    description = "lambda function handler"
    default = "createImage.lambda_handler"
}

variable "instance_filename" {
    description = "filename for createInstance function"
    default = "../scripts/lambda/createInstance.zip"
}

variable "instance_function_name" {
    description = "Name of lambda function"
    default = "createAMI"
}

variable "instance_handler" {
    description = "lambda function handler"
    default = "createAMI.lambda_handler"
}

variable "runtime" {
    description = "runtime for lambda environment"
    default = "python3.8"
}