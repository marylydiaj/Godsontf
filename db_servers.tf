resource "aws_security_group" "dbsg" {
    name = "vpc_db"
    description = "Allow incoming database connections."
    vpc_id = aws_vpc.customvpc.id

    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/24"]
  }
  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }
  tags = {
    Name = "sg"
  }
}

resource "aws_instance" "db1" {
    ami = var.image
    availability_zone = "us-east-1b"
    instance_type = var.instance_type
    key_name = var.key
    user_data = data.template_file.db1.rendered
    vpc_security_group_ids = [aws_security_group.dbsg.id]
    subnet_id = aws_subnet.us-east-1b-private.id
    source_dest_check = false

    tags = {
        Name = "DB Server"
        Terraform = true
    }
    provisioner "local-exec" {
         command = "echo ${aws_instance.db1.private_ip} >> /var/lib/jenkins/workspace/terragods/privateip"
    }
}
data "template_file" "db1" {
  template = file("privateinstall.sh")
}
