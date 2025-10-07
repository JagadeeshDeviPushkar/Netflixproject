provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0f9708d1cd2cfee41"
  instance_type          = "t2.medium"
  key_name               = "saleemkeyp"
  vpc_security_group_ids = ["sg-01d2f16fde2654d0d"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}