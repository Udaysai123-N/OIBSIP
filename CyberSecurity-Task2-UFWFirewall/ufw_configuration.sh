#!/bin/bash
set -e

# Firewall configuration for my internship lab.
# Allow SSH before enabling the firewall.
sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw allow 22/tcp
sudo ufw deny 80/tcp
sudo ufw allow 443/tcp
sudo ufw deny 23/tcp

sudo ufw enable
sudo ufw status verbose
