resource "aws_instance" "private-servers" {
  # count = length(var.private_cird_block)
  count                  = var.environment == "Prod" ? 3 : 1
  ami                    = lookup(var.amis, var.aws_region)
  instance_type          = "t2.micro"
  key_name               = var.key_name
  subnet_id              = element(var.private_subnets, count.index)
  vpc_security_group_ids = [var.sg_id]
  iam_instance_profile = var.iam_instance_profile
  # associate_public_ip_address = true	
  tags = {
    Name        = "${var.vpc_name}-Private-Server-${count.index}"
    # Owner       = local.Owner
    # costcenter  = local.costcenter
    # TeamDL      = local.TeamDL
    environment = "${var.environment}"
  }
  user_data = <<-EOF
     #!/bin/bash
     sudo apt update
     sudo apt install nginx -y
     sudo apt install git -y
     sudo git clone https://github.com/saikiranpi/SecOps-game.git
     sudo rm -rf /var/www/html/index.nginx-debian.html
     sudo cp  SecOps-game/index.html /var/www/html/index.html
     echo "<h1>${var.vpc_name}-public-Server-${count.index + 1}</h1>" >> /var/www/html/index.html
     sudo systemctl start nginx
     sudo systemctl enable nginx
 EOF
  depends_on = [var.elb_listener_public]
}


