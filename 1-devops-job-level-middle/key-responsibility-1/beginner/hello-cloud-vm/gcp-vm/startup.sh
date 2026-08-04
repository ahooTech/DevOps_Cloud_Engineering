#!/bin/bash
set -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y apache2

systemctl enable apache2
systemctl start apache2

echo "<h1>Hello from my Terraform-built GCP Computer!</h1><p>Apache is running successfully.</p>" > /var/www/html/index.html