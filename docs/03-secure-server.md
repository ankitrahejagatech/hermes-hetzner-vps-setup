# 03. Secure the Server

This step creates a non-root user, configures SSH, and installs basic security tools.

## 1. Create a Deploy User

SSH into the server as root:

```bash
ssh root@<your-server-ip>
```

Create a user:

```bash
adduser hermes
usermod -aG sudo hermes
```

Copy SSH access from root to the new user:

```bash
rsync --archive --chown=hermes:hermes ~/.ssh /home/hermes
```

Test the new login from your local machine:

```bash
ssh hermes@<your-server-ip>
```

## 2. Install Base Packages

Run:

```bash
sudo apt update
sudo apt install -y curl wget git jq unzip tar htop ufw fail2ban ca-certificates gnupg build-essential
```

## 3. Configure UFW

Hetzner firewall protects traffic before it reaches the VPS. UFW adds a second local firewall layer.

Run:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status verbose
```

## 4. Harden SSH

Open SSH config:

```bash
sudo nano /etc/ssh/sshd_config
```

Recommended settings:

```text
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
```

Validate and restart SSH:

```bash
sudo sshd -t
sudo systemctl restart ssh
```

Before closing the root SSH session, open a second terminal and confirm this works:

```bash
ssh hermes@<your-server-ip>
```

## 5. Enable Fail2Ban

Run:

```bash
sudo systemctl enable --now fail2ban
sudo systemctl status fail2ban
```

## 6. Set Timezone

Use UTC for servers:

```bash
sudo timedatectl set-timezone UTC
timedatectl
```

Next: [Install Hermes agent](04-install-hermes-agent.md)

