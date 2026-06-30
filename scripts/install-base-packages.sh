#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install -y \
  curl \
  wget \
  git \
  jq \
  unzip \
  tar \
  htop \
  ufw \
  fail2ban \
  ca-certificates \
  gnupg \
  build-essential

echo "Base packages installed."

