resource "aws_security_group" "dbsg" {
    name = "vpc_db"
    description = "Allow incoming database connections."
    vpc_id = aws_vpc.customvpc.id

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = [aws_security_group.websg.id]
    }
	egress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = [aws_security_group.websg.id]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.vpc_cidr]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = [var.vpc_cidr]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
        Name = "DBServerSG"
        Terraform = true
    }
}

resource "aws_instance" "db1" {
    ami = var.image
    availability_zone = "us-east-1b"
    instance_type = var.instance_type
    key_name = var.key
    vpc_security_group_ids = [aws_security_group.dbsg.id]
    subnet_id = aws_subnet.us-east-1b-private.id
    source_dest_check = false

    tags = {
        Name = "DB Server"
        Terraform = true
    }
}
