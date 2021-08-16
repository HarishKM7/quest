#!/bin/bash

curl -sL https://rpm.nodesource.com/setup_16.x | bash -
yum install -y nodejs

yum install -y docker
usermod -aG docker ec2-user
systemctl enable docker
systemctl start docker
