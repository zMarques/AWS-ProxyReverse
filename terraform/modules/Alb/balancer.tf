resource "aws_lb" "my_alb" {

  name               = "${var.projeto}-alb-tf"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = var.security_groups_id

  dynamic "subnet_mapping" {
    for_each = local.subnets

    content {
      subnet_id = subnet_mapping.value
    }
  }

  tags = {
    Name = "${var.projeto}-alb"
  }
}

resource "aws_lb_listener" "listener_80" {

  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content 80"
      status_code  = "200"
    }
  }

  tags = {
    Name = "${var.projeto}-alb-listener-80"
  }
}

resource "aws_lb_listener" "listener_443" {

  count = var.ssl != null ? 1 : 0

  load_balancer_arn = aws_lb.my_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.ssl.cert_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content 443"
      status_code  = "200"
    }
  }

  tags = {
    Name = "${var.projeto}-alb-listener-443"
  }
}
