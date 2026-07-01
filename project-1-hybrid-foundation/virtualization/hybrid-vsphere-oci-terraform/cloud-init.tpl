#cloud-config
# Bridge Node Initialization - CIS Hardened + Hypervisor Tools

# Don't auto-upgrade packages (can delay boot)
package_update: true
package_upgrade: false

packages:
  # Core utilities
  - curl
  - wget
  - net-tools
  - htop
  - jq
  - rsync
  - unzip
  - python3-pip
  
  # Security & auditing
  - auditd
  - fail2ban
  
  # KVM/Libvirt tools
  - qemu-kvm
  - libvirt-daemon-system
  - libvirt-clients
  - bridge-utils
  
  # VMware tools (for vSphere sync)
  - open-vm-tools
  
  # Hyper-V tools (for Hyper-V sync)
  - hyperv-daemons
  
  # OCI tools (for bare-metal sync)
  - python3-oci-sdk

# SSH key injection
ssh_authorized_keys:
  - "${ssh_key}"

# Write configuration files
write_files:
  # CIS-compliant audit rules
  - path: /etc/audit/rules.d/99-hybrid-hardening.rules
    permissions: '0600'
    content: |
      # Identity changes
      -w /etc/passwd -p wa -k identity
      -w /etc/shadow -p wa -k identity
      -w /etc/group -p wa -k identity
      
      # SSH configuration
      -w /etc/ssh/sshd_config -p wa -k sshd
      
      # Audit logs
      -w /var/log/audit/ -p wa -k auditlog
      
      # Libvirt configuration
      -w /etc/libvirt/ -p wa -k libvirt
      
      # Sudoers
      -w /etc/sudoers -p wa -k sudoers
      -w /etc/sudoers.d/ -p wa -k sudoers

  # Fail2ban configuration
  - path: /etc/fail2ban/jail.local
    permissions: '0644'
    content: |
      [DEFAULT]
      bantime = 3600
      findtime = 600
      maxretry = 3
      
      [sshd]
      enabled = true
      port = ssh
      filter = sshd
      logpath = /var/log/auth.log
      maxretry = 3

  # CIS-compliant sysctl hardening
  - path: /etc/sysctl.d/99-hybrid-security.conf
    permissions: '0644'
    content: |
      # Network security
      net.ipv4.ip_forward = 0
      net.ipv4.conf.all.accept_redirects = 0
      net.ipv4.conf.all.send_redirects = 0
      net.ipv4.conf.all.accept_source_route = 0
      net.ipv6.conf.all.accept_redirects = 0
      net.ipv6.conf.all.accept_source_route = 0
      
      # Kernel security
      kernel.kptr_restrict = 2
      kernel.dmesg_restrict = 1
      kernel.sysrq = 0
      
      # File system security
      fs.suid_dumpable = 0

  # Bridge sync configuration
  - path: /etc/bridge/sync-config.yaml
    permissions: '0640'
    content: |
      bridge:
        private_ip: $(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
        public_ip: $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
        region: us-east-1
        environment: dev-lab
      
      hypervisors:
        kvm:
          enabled: true
          libvirt_uri: qemu+ssh://ubuntu@localhost/system
        vsphere:
          enabled: false  # Uncomment when vCenter is available
          # vcenter_server: vcenter.example.com
        hyperv:
          enabled: true
          winrm_port: 5986
        oci:
          enabled: true
          region: us-ashburn-1

# Run commands on first boot
runcmd:
  # Enable and start services
  - systemctl enable auditd fail2ban libvirtd
  - systemctl start auditd fail2ban libvirtd
  
  # Harden SSH (robust method)
  - |
    cat >> /etc/ssh/sshd_config << 'EOF'
    
    # CIS Hardening
    PermitRootLogin no
    PasswordAuthentication no
    PermitEmptyPasswords no
    X11Forwarding no
    MaxAuthTries 3
    ClientAliveInterval 300
    ClientAliveCountMax 2
    EOF
  - systemctl restart sshd
  
  # Apply sysctl hardening
  - sysctl --system
  
  # Configure auditd
  - augenrules --load
  - systemctl restart auditd
  
  # Create bridge admin user (optional)
  - useradd -m -s /bin/bash bridge-admin || true
  - usermod -aG libvirt bridge-admin || true
  
  # Log success
  - echo "✅ $(date): Bridge node hardened and ready" >> /var/log/hybrid-bridge.log
  - echo "  - Audit rules loaded" >> /var/log/hybrid-bridge.log
  - echo "  - Fail2ban active" >> /var/log/hybrid-bridge.log
  - echo "  - Libvirt daemon running" >> /var/log/hybrid-bridge.log
  - echo "  - SSH hardened (root login disabled, key-only)" >> /var/log/hybrid-bridge.log

# Final message
final_message: "✅ Cloud-init complete. Bridge node is ready for hypervisor sync."