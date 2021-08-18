#!/bin/bash

yum install -y docker
usermod -aG docker ec2-user
systemctl enable docker
systemctl start docker

docker run --rm -p 3030:3000 kmharish/rearc
