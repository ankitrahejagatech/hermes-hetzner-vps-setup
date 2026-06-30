# 06. Operations and Troubleshooting

Use this page after Hermes Agent and Telegram gateway are installed.

## Common Commands

Check gateway status:

```bash
systemctl --user status hermes-gateway
```

Start gateway:

```bash
systemctl --user start hermes-gateway
```

Stop gateway:

```bash
systemctl --user stop hermes-gateway
```

Restart gateway:

```bash
systemctl --user restart hermes-gateway
```

Follow logs:

```bash
journalctl --user -u hermes-gateway -f
```

Show recent logs:

```bash
journalctl --user -u hermes-gateway -n 100 --no-pager
```

## Update Hermes

```bash
hermes backup
hermes update
hermes config migrate
hermes doctor
systemctl --user restart hermes-gateway
```

## Check the Server

```bash
df -h
free -h
uptime
```

## SSH Troubleshooting

From your own local machine:

```bash
ssh -v root@<your-server-ip>
```

Check:

- The server is powered on in Hetzner.
- You are using the right public IP.
- Your SSH key was added when the server was created.
- Port 22 is allowed by the firewall.

## Hermes Troubleshooting

Run:

```bash
hermes doctor
```

Check logs:

```bash
journalctl --user -u hermes-gateway -n 100 --no-pager
```

Check env values:

```bash
nano ~/.hermes/.env
```

Restart after changes:

```bash
systemctl --user restart hermes-gateway
```

