#!/bin/bash

# Create web folder
mkdir -p /var/www/web

# Create simple web page
cat > /var/www/web/index.html <<'HTML'
<html>
  <body>
    <h1>Jubilee Cloud Foundation</h1>
    <p>This web server is running in a private subnet.</p>
    <p>Only approved internal traffic can reach it.</p>
  </body>
</html>
HTML

# Create systemd service
cat > /etc/systemd/system/simple-web.service <<'UNIT'
[Unit]
Description=Simple Python Web Server
After=network.target

[Service]
ExecStart=/usr/bin/python3 -m http.server 80 --directory /var/www/web
Restart=always
User=root

[Install]
WantedBy=multi-user.target
UNIT

# Enable and start service
systemctl daemon-reload
systemctl enable --now simple-web.service