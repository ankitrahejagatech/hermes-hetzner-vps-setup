# 03. SSH and Prepare the VPS

Follow this section after the Hetzner account, project, and VPS are created.

Source guide:

```text
https://www.reddit.com/r/hermesagent/comments/1t2raft/complete_guide_how_to_host_hermes_agent_on_a/
```

## 1. SSH From Your Local Machine

Open Terminal on your own local machine and SSH into the server:

```bash
ssh root@<your-server-ip>
```

Replace `<your-server-ip>` with the public IPv4 address from Hetzner.

## 2. Update the Server

```bash
apt update && apt upgrade -y
```

## 3. Install Required Packages

```bash
apt install -y curl git ufw
```

## 4. Enable the Firewall

```bash
ufw allow OpenSSH
ufw enable
ufw status
```

Next: [Install Hermes Agent](04-install-hermes-agent.md)

