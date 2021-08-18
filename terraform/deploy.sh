#!/bin/bash
sudo yum update -y

# Install Node.js
curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo yum update -y
sudo yum install -y nodejs

# NPM install
cd ~/app || exit
chmod +x bin/*
npm install

# Rearc service
sudo mv ~/app/rearc.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable rearc
sudo systemctl start rearc

# Docker
sudo yum install -y docker
sudo usermod -aG docker ec2-user
sudo systemctl enable docker
sudo systemctl start docker

# Rearc Docker conatiner
sudo docker run -p 3030:3000 kmharish/rearc
