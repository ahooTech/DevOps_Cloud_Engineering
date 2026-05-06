#!/bin/bash
# RHEL/Alma specific parity
dnf install -y firewalld net-tools jq chrony
systemctl enable --now firewalld

firewall-cmd --permanent --add-service=ssh
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="10.10.0.0/16" accept'
firewall-cmd --reload

# SELinux permissive for dev parity (documented for prod enforcement later)
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config