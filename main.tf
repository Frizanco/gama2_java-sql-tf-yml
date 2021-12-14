
variable "maquinas" {
  default     = {
    maq1 = {"Name"="ec2-turma3-frizanc-ANC+TF+JAVA", "type" = "t2.large", "subnet" = "subnet-0bc78dd75eb924a43"}
    #maq2 = {"Name"="ec2-turma3-frizanc-TF-II", "type" = "t2.medium", "subnet" = "subnet-0cc65520734fdc370"}
    #maq3 = {"Name"="ec2-turma3-frizanc-TF-III", "type" = "t2.micro", "subnet" = "subnet-0cc65520734fdc370"}
  }
}

provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web2" {
  subnet_id = var.maquinas.maq1.subnet
  ami = "ami-0e66f5495b4efdd0f"
  instance_type = var.maquinas.maq1.type
  key_name = "cert-turma3-frizanco-dev" # nome lá na AWS quando criamos máquina
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-02d78afe948cd36bf"]
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = var.maquinas.maq1.Name
  }
}

output ec2 {
  value = aws_instance.web2.public_dns
}

resource "local_file" "hosts" {
  filename = "hosts"
}