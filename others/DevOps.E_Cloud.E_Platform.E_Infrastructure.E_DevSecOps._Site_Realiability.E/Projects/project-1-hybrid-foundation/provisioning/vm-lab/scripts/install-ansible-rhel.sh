#!/bin/bash
set -e

echo "🔧 Installing Ansible on RHEL/AlmaLinux with retries..."

retry() {
  local n=1
  local max=5
  local delay=2

  while true; do
    "$@" && break || {
      if [[ $n -lt $max ]]; then
        echo "⚠️ Attempt $n failed. Retrying in ${delay}s..."
        sleep $delay
        ((n++))
        ((delay*=2))
      else
        echo "❌ Failed after $n attempts: $*"
        return 1
      fi
    }
  done
}

# Install EPEL
for mirror in \
  "https://dl.fedoraproject.org/pub/epel" \
  "https://mirrors.edge.kernel.org/fedora-epel" \
  "https://ftp.osuosl.org/pub/epel"
do
  if retry curl -fL -o /tmp/epel.rpm \
    "${mirror}/epel-release-latest-9.noarch.rpm"; then

    sudo rpm -Uvh --quiet /tmp/epel.rpm
    break
  fi
done

# Enable CRB repository
sudo crb enable || true

# Refresh metadata
retry sudo dnf makecache

# Install Ansible + dependencies
retry sudo dnf install -y \
  ansible \
  python3-libselinux \
  git \
  sshpass

# Verify installation
ansible --version

echo "✅ Ansible installed successfully"


#***********Exponential Backoff + Retry
