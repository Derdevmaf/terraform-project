resource "aws_instance" "web-server-2" {
  ami                    = "ami-020cba7c55df1f615"  #modelo ami da máquina
  instance_type          = "t2.micro"
  key_name               = "SecondKeys" #Adicione sua Key Pairs da AWS aqui!
  user_data              = file("script.sh")

  security_groups = [aws_security_group.allow_web.name]

  tags = {
    Name = "Quinta tentativa"
  }
}