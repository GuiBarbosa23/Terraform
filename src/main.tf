provider "aws"{
    version = "~=>2.0" // versao
    region = "us-east-1" //regiao aws
}

resource "aws_instance" "dev"{
    count = 3
    ami = "ami-026c8acd92718196b" //codigo da imagem aws
    instance_type = "t2.micro" //tipo da instância
    key_name = "terraform-aws"//chave ssh
    tags = {
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = ["id do ssh criado"]
}

resource "aws_security_group" "acesso-ssh" {
    name = "acesso-ssh"
    description = "acesso-ssh"
    ingress = [ {
      cidr_blocks = [ "your ip" ]
      from_port = 22
      protocol = "tcp"
      to_port = 22
    } ]
tags = {
  "Name" = "ssh"
}
  
}