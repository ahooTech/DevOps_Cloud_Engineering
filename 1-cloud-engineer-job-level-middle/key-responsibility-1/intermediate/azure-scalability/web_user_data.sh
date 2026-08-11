#!/bin/bash
mkdir -p /var/www/web

# Unquoted HTML so $(hostname) expands at boot
cat > /var/www/web/index.html <<HTML
<html>
  <body>
    <h1>Jubilee Cloud Foundation (Azure Edition)</h1>
    <p>This web server is running in a private Azure subnet.</p>
    <p><strong>Served by: $(hostname)</strong></p>
  </body>
</html>
HTML

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

systemctl daemon-reload
systemctl enable --now simple-web.service