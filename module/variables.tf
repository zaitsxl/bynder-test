variable "project_name" {
    type = "string"
    default = "poc-project"
}

variable "aws_region" {
    type = "string"
    default = "eu-west-1"
}

variable "instance_type" {
    type = "string"
    default = "t2.micro"
}

variable "ami_id" {
    type = "string"
    default = "ami-100500"
}

variable "dns_zone" {
    type = "string"
    default = "example.com."
}
