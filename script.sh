#!/bin/bash

sudo yum update -y

sudo yum install git -y

sudo yum install docker -y

sudo usermod -a -G docker ssm-user

id ssm-user

sudo newgrp docker

#Ativar docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo systemctl status docker

sudo docker run --name nginx -d -p 80:80 some-nginx

sudo docker ps


