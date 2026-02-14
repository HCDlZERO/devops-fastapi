#!/bin/bash
set -ex

apt update
apt install -y docker.io git nodejs npm nginx

systemctl start docker
systemctl enable docker

systemctl start nginx
systemctl enable nginx

usermod -aG docker ubuntu