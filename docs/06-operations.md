# 06. Operations and Troubleshooting

Use this page after Hermes is installed.

## Common Commands

Check service status:

```bash
systemctl --user status hermes-gateway
```

Start service:

```bash
systemctl --user start hermes-gateway
```

Stop service:

```bash
systemctl --user stop hermes-gateway
```

Restart service:

```bash
systemctl --user restart hermes-gateway
```

Follow logs:

```bash
journalctl --user -u hermes-gateway -f
```

Show recent logs:

```bash
journalctl --user -u hermes-gateway -n 200 --no-pager
```

## Update Hermes

Before updating, make a backup:

```bash
hermes backup
hermes update
hermes config migrate
hermes doctor
systemctl --user restart hermes-gateway
```

## Check Disk and Memory

```bash
df -h
free -h
htop
```

## Check Network

```bash
curl -4 ifconfig.me
curl -6 ifconfig.me
sudo ufw status verbose
```

## Backup Notes

For production:

1. Enable Hetzner backups or scheduled snapshots.
2. Back up `~/.hermes/.env` securely.
3. Run `hermes backup` regularly.
4. Never store backups in a public GitHub repository.

## Troubleshooting

### SSH does not connect

- Check the Hetzner firewall allows port 22 from your current IP.
- Check the server is powered on.
- Check you are using the correct SSH key.
- From your own local machine, try `ssh -v hermes@<your-server-ip>` for verbose output.

### Service starts then exits

Run:

```bash
journalctl --user -u hermes-gateway -n 200 --no-pager
```

Look for:

- Missing environment variables.
- Missing runtime dependency.
- Wrong `WorkingDirectory`.
- Wrong `ExecStart`.
- Permission errors.

### Environment variables are not loading

Check:

```bash
ls -l ~/.hermes/.env
cat ~/.hermes/.env
```

### Server needs more resources

In Hetzner Console, use the server rescale option. Stop the Hermes service before resizing if the workload is sensitive:

```bash
systemctl --user stop hermes-gateway
```

After resizing:

```bash
systemctl --user start hermes-gateway
```
