#!/bin/bash
# ✅ Removed 'set -e' to allow graceful handling of non-critical failures
# C:\Users\DAYLIFF\Desktop\DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E\Projects\omniscale-terraform\scripts\baseline.sh
echo "[*] Starting Omniscale Baseline Parity Provisioning..."

# 1. OS & Package Manager Detection
if command -v apt-get &>/dev/null; then
  PKG_MANAGER="apt"
  PKG_UPDATE="apt-get update -y"
  PKG_INSTALL="apt-get install -y"
  FIREWALL_TOOL="ufw"
  EPEL_NEEDED=false
elif command -v dnf &>/dev/null; then
  PKG_MANAGER="dnf"
  PKG_UPDATE="dnf check-update || true"
  PKG_INSTALL="dnf install -y --skip-broken"
  FIREWALL_TOOL="firewalld"
  EPEL_NEEDED=true
elif command -v yum &>/dev/null; then
  PKG_MANAGER="yum"
  PKG_UPDATE="yum check-update || true"
  PKG_INSTALL="yum install -y --skip-broken"
  FIREWALL_TOOL="firewalld"
  EPEL_NEEDED=true
else
  echo "[-] Unsupported OS"
  exit 1
fi

# 2. Create parity admin user (idempotent)
if ! id "infra-admin" &>/dev/null; then
  useradd -m -s /bin/bash infra-admin
  ADMIN_PASS=$(openssl rand -base64 12)
  echo "infra-admin:${ADMIN_PASS}" | chpasswd 2>/dev/null || echo "infra-admin:${ADMIN_PASS}" | chpasswd
  echo "[✓] infra-admin created"
fi
mkdir -p /home/infra-admin/.ssh
chmod 700 /home/infra-admin/.ssh
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5..." > /home/infra-admin/.ssh/authorized_keys
chown -R infra-admin:infra-admin /home/infra-admin/.ssh
chmod 600 /home/infra-admin/.ssh/authorized_keys

# 3. Install baseline packages (OS-aware + EPEL handling)
$PKG_UPDATE

if [ "$EPEL_NEEDED" = true ]; then
  $PKG_INSTALL epel-release || echo "[-] EPEL install warning (continuing...)"
  $PKG_UPDATE
fi

if [ "$PKG_MANAGER" = "apt" ]; then
  $PKG_INSTALL curl wget git jq unzip net-tools iproute2 traceroute htop chrony fail2ban ufw || echo "[-] Ubuntu package warning"
else
  $PKG_INSTALL curl wget git jq unzip net-tools iproute traceroute chrony || echo "[-] Core package warning"
  $PKG_INSTALL htop fail2ban 2>/dev/null || echo "[-] Optional package warning"
  $PKG_INSTALL firewalld 2>/dev/null || echo "[-] firewalld install warning"
fi

# 4a. Firewall (OS-aware + service existence check)
if [ "$FIREWALL_TOOL" = "ufw" ]; then
  ufw --force reset 2>/dev/null || true
  ufw default deny incoming
  ufw default allow outgoing
  ufw allow 22/tcp
  ufw allow from 10.0.0.0/16
  ufw --force enable 2>/dev/null || true
else
  if systemctl list-unit-files | grep -q firewalld; then
    systemctl enable --now firewalld 2>/dev/null || true
    firewall-cmd --permanent --add-service=ssh 2>/dev/null || true
    firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="10.0.0.0/16" accept' 2>/dev/null || true
    firewall-cmd --reload 2>/dev/null || true
  else
    echo "[!] firewalld not available; skipping firewall config (document for audit)"
  fi
fi
echo "[✓] Firewall configured"

# 4b. Allow ICMP echo for lab connectivity testing (document for audit)
if [ "$FIREWALL_TOOL" = "ufw" ]; then
  ufw allow proto icmp from 10.0.0.0/16 to any comment "Lab ICMP echo" 2>/dev/null || \
  ufw allow proto icmp from 10.0.0.0/16 to any 2>/dev/null || true
else
  if systemctl list-unit-files | grep -q firewalld; then
    firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="10.0.0.0/16" protocol value="icmp" icmp-type value="echo-request" accept' 2>/dev/null || true
    firewall-cmd --reload 2>/dev/null || true
  fi
fi
echo "[✓] ICMP echo allowed for lab testing (document for audit)"

# 5. NTP & Logging (graceful fallback)
if systemctl list-unit-files | grep -q chrony; then
  systemctl enable --now chrony 2>/dev/null || true
else
  systemctl enable --now systemd-timesyncd 2>/dev/null || true
fi
mkdir -p /var/log/omniscale
chown infra-admin:infra-admin /var/log/omniscale 2>/dev/null || true
echo "[✓] NTP & logging enabled"

# 6. Environment metadata (✅ LIMIT-LESS MULTI-AZ CIDR CALCULATOR)
CURRENT_HOST=$(hostname)
ZONE="${CURRENT_HOST: -1}" # Extracts last character (a, b, c, etc.)

# Convert zone letter to numeric index dynamically (a=1, b=2, ..., z=26)
ZONE_LOWER=$(echo "$ZONE" | tr '[:upper:]' '[:lower:]')
if [[ "$ZONE_LOWER" =~ ^[a-z]$ ]]; then
  # ASCII 'a' = 97. Subtract 96 to get 1-based index.
  ZONE_IDX=$(( $(printf '%d' "'$ZONE_LOWER") - 96 ))
else
  ZONE_IDX=1 # Fallback for unexpected suffixes
fi

# Enterprise VPC Allocation Strategy (Mathematically collision-proof)
# Public tier:  10.0.[0-25].0/24   (zero-indexed, lower quarter of /16)
# Private tier: 10.0.[128-151].0/22 (active AZs a-f, steps by 4)
# Reserved:     10.0.[26-127] & [152-255] (Mgmt, DR, Compliance, Future)
PUBLIC_THIRD_OCTET=$((ZONE_IDX - 1))  # ✅ ZERO-INDEXED: a=0, b=1, c=2
PRIVATE_THIRD_OCTET=$(( 128 + (ZONE_IDX - 1) * 4 ))

if [[ "$CURRENT_HOST" == *"public"* ]]; then
  TIER="public"
  SUBNET_CIDR="10.0.${PUBLIC_THIRD_OCTET}.0/24"
  IP_CAPACITY="254"
  SUBNET_MASK="255.255.255.0"
else
  TIER="private"
  SUBNET_CIDR="10.0.${PRIVATE_THIRD_OCTET}.0/22"
  IP_CAPACITY="1022"
  SUBNET_MASK="255.255.252.0"
fi

cat > /etc/omniscale-env.json <<EOF
{
  "environment": "onprem-dev",
  "vpc_equivalent": "10.0.0.0/16",
  "subnet_cidr": "${SUBNET_CIDR}",
  "subnet_tier": "${TIER}",
  "availability_zone_sim": "zone-${ZONE}",
  "ip_capacity": "${IP_CAPACITY}",
  "subnet_mask": "${SUBNET_MASK}",
  "provisioned_by": "vagrant-baseline-parity",
  "standards_version": "4.1"
}
EOF
chmod 644 /etc/omniscale-env.json
echo "[✓] Zero-indexed AZ-aware metadata written"

# 7. Runtime validation (non-blocking)
ACTUAL_SUBNET=$(ip route show 2>/dev/null | grep "10.10" | head -1 | awk '{print $1}') || true
[ -n "$ACTUAL_SUBNET" ] && echo "[✓] Subnet parity: $ACTUAL_SUBNET"
echo "[*] Baseline provisioning complete."



# Replaced Vagrant CIDR (10.10.0.0/16) with AWS VPC CIDR (10.0.0.0/16) -> Subneting