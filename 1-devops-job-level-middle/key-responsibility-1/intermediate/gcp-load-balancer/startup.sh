#!/bin/bash
set -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y apache2

systemctl enable apache2
systemctl start apache2

# MID-LEVEL DEVOPS TRICK: 
# Ask the GCP Metadata Server for this specific VM's name dynamically!
INSTANCE_NAME=$(curl -s "http://metadata.google.internal/computeMetadata/v1/instance/name" -H "Metadata-Flavor: Google")

echo "<h1>Hello from Pizza Web Server ${INSTANCE_NAME}!</h1>" > /var/www/html/index.html