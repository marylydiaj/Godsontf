##### EC2 Instance ######

resource "aws_instance" "Dijango" {
 ami                         = var.image
 instance_type               = var.instance_type
 key_name                    = var.key
 monitoring                  = true
 user_data                   = data.template_file.dijango.rendered
 vpc_security_group_ids      = [aws_security_group.sg.id]
 subnet_id                   = aws_subnet.public_subnet.id
 associate_public_ip_address = true

 tags = {
   Name        = "Dijango"
   }
#user_data = <<HEREDOC
#
#HEREDOC
}

data "template_file" "dijango" {
  template = file("install.sh")
}

#data "aws_ami" "amazon_linux" {
#  most_recent = true
#  owners      = ["099720109477"]
#  filter {
#    name = "name"
#    values = [
#      "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*",
#    ]
#  }
#}

####### Security Group #########

resource "aws_security_group" "sg" {
 vpc_id      = aws_vpc.vpc_name.id
 name        = "security-group"
 description = "Allow SSH and http and https"
 ingress {
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
 ingress {
       from_port   = 8000
       to_port     = 8000
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
   egress {
       from_port   = 8000
       to_port     = 8000
       protocol    = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
   }
 tags = {
   Name        = "gods-sg"
  }
}
#Creating EBS volume 

resource "aws_ebs_volume" "data-vol" {
 availability_zone = "us-west-1a"
 size = 10
 tags = {
        Name = "data-volume"
 }

}

#Attaching volume with Instance

resource "aws_volume_attachment" "dijango-vol" {
 device_name = "/dev/sdc"
 volume_id = aws_ebs_volume.data-vol.id
 instance_id = aws_instance.Dijango.id
}

