module "aws-poc" {
    source = "./module"
    aws_region = "${var.aws_region}"
    instance_type = "${var.instance_type}"
}

module "aws-poc-2" {
    source = "./module"
    aws_region = "eu-north-1"
    instance_type = "${var.instance_type}"
}
