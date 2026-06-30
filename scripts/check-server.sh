#!/usr/bin/env bash
set -euo pipefail

echo "== Host =="
hostnamectl

echo
echo "== Disk =="
df -h

echo
echo "== Memory =="
free -h

echo
echo "== Firewall =="
sudo ufw status verbose || true

echo
echo "== Hermes gateway =="
systemctl --user status hermes-gateway --no-pager || true

echo
echo "== Hermes doctor =="
hermes doctor || true
