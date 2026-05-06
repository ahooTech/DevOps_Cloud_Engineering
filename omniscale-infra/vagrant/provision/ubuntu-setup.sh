#!/bin/bash
set -e

echo "[*] Running Ubuntu-specific hardening..."

# Disable password auth, enforce SSH keys only
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart sshd

# ✅ FIXED: Non-interactive unattended-upgrades installation
export DEBIAN_FRONTEND=noninteractive
apt-get install -y unattended-upgrades
dpkg-reconfigure -plow unattended-upgrades || true

# Configure automatic security updates only
cat > /etc/apt/apt.conf.d/50unattended-upgrades <<'EOF'
Unattended-Upgrade::Allowed-Origins {
    "${distro_id}:${distro_codename}-security";
};
EOF

echo "[✓] Ubuntu hardening complete"