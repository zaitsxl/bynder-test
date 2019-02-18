resource "aws_elb" "poc-loadbalancer" {
    name = "${var.project_name}"

    listener {
        instance_port = 8080
        instance_protocol = "http"
        lb_port = 8080
        lb_protocol = "http"
    }

    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        target = "HTTP:8080/"
        interval = 30
    }
  
    instances = ["${aws_instance.poc-backend-node.id}"]
    cross_zone_load_balancing = true
    idle_timeout = 300
    connection_draining = true
    connection_draining_timeout = 300

    depends_on = ["aws_instance.poc-backend-node"]
    tags = {
        Name = "${var.project_name}"
    }
}
