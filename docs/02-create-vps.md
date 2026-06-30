# 02. Create the Hetzner VPS

This step provisions the server that will run the Hermes agent.

## 1. Open the Project

Go to:

```text
https://console.hetzner.com/
```

Open the Cloud project created in step 01.

## 2. Create the Server

In the project:

1. Go to Servers.
2. Select Add Server.
3. Choose location:

```text
Helsinki, Finland (hel1)
```

4. Choose image:

```text
Ubuntu 24.04 LTS
```

5. Choose type:

```text
Shared vCPU
Cost optimized
CX33
```

6. Add the SSH key created in step 01.
7. Enable IPv4 and IPv6.
8. Enable backups if this is production.
9. Name the server. In this setup we used:

```text
ubuntu-8gb-hel1-2
```

10. Create the server.

## 3. Firewall

This setup did not start with a Hetzner Cloud firewall.

For a public guide, the safer recommendation is still:

| Type | Port | Source | Purpose |
| --- | --- | --- | --- |
| TCP | 22 | Your IP address only | SSH access |
| ICMP | Any | Your IP address only | Ping/debugging |

If you skip the Hetzner firewall, make sure you configure UFW on the server in the next step.

## 4. Save the Server IP

After creation, copy the public IPv4 address.

Record it privately:

```text
HERMES_SERVER_IP=<your-server-ip>
```

## 5. Connect Over SSH

From your local machine:

```bash
ssh root@<your-server-ip>
```

If SSH fails:

1. Confirm the firewall allows port 22 from your current public IP.
2. Confirm you selected the right SSH key when creating the server.
3. Confirm you are using the correct server IP.

## 6. Update the Server

Run:

```bash
apt update && apt upgrade -y
apt install -y curl git ufw
reboot
```

Reconnect after the reboot:

```bash
ssh root@<your-server-ip>
```

Next: [Secure the server](03-secure-server.md)
