#cloud-config
package_upgrade: true
packages:
  - qemu-kvm
  - libvirt-daemon-system
  - libvirt-clients
  - bridge-utils
  - open-vm-tools
  - open-vm-tools-desktop
  - auditd
  - fail2ban
  - net-tools
  - htop
  - curl
  - wget

ssh_authorized_keys:
  - "${ssh_key}"

write_files:
  - path: /etc/audit/rules.d/99-hybrid-hardening.rules
    permissions: '0600'
    content: |
      -w /etc/passwd -p wa
      -w /etc/shadow -p wa
      -w /etc/ssh/sshd_config -p wa
      -w /var/log/audit/ -p wa
      -w /etc/libvirt/ -p wa

  - path: /etc/fail2ban/jail.local
    permissions: '0644'
    content: |
      [sshd]
      enabled = true
      maxretry = 3
      bantime = 3600
      findtime = 600

  - path: /etc/sysctl.d/99-hybrid-security.conf
    permissions: '0644'
    content: |
      net.ipv4.ip_forward=0
      net.ipv4.conf.all.accept_redirects=0
      net.ipv4.conf.all.send_redirects=0
      kernel.kptr_restrict=2
      kernel.dmesg_restrict=1

runcmd:
  # Enable & start services
  - systemctl enable auditd fail2ban libvirtd
  - systemctl start auditd fail2ban libvirtd
  
  # Harden SSH
  - sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
  - sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
  - systemctl restart sshd
  
  # Apply sysctl hardening
  - sysctl -p /etc/sysctl.d/99-hybrid-security.conf
  
  # Log success
  - echo "✅ $(date): Bridge node hardened, virtualization tools ready" >> /var/log/hybrid-bridge.log