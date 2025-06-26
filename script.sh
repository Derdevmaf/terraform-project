#!/bin/bash

sudo yum update -y

sudo yum install git -y

sudo yum install docker -y

sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo systemctl status docker

sudo usermod -a -G docker ec2-user


id ssm-user

sudo newgrp docker

docker network create app-network

#Ativar docker
sudo docker run --name nginx -d -p 80:80 some-nginx
sudo docker run -d --name hello-web --network app-network -p 80:80 nginx:alpine


sudo docker ps


 # Criar container para fazer chamadas
              docker run -d --name api-caller --network app-network curlimages/curl \
                sh -c 'while true; do curl -s hello-web > /tmp/result.txt; sleep 30; done'
              
              # Executar MySQL
              docker run -d --name mysql-db \
                --network app-network \
                -e MYSQL_ROOT_PASSWORD=rootpass \
                -e MYSQL_DATABASE=app_db \
                -e MYSQL_USER=app_user \
                -e MYSQL_PASSWORD=app_pass \
                mysql:5.7


