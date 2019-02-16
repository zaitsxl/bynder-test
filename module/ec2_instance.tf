resource "aws_instance" "poc-backend-node" {
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"

    tags = {
        Name = "${var.project_name}"
    }
}
