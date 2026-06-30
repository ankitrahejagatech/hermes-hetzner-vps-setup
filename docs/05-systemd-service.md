# 05. Run Hermes Persistently

This step keeps Hermes running after logout and starts it after reboot.

## 1. Install the Gateway Service

Run as the `hermes` user:

```bash
hermes gateway setup
hermes gateway install
```

## 2. Enable and Start

```bash
systemctl --user enable --now hermes-gateway
```

## 3. Check Status

```bash
systemctl --user status hermes-gateway
```

## 4. Watch Logs

```bash
journalctl --user -u hermes-gateway -f
```

## 5. Set a Working Directory

This is useful so Telegram/remote commands run from a predictable folder:

```bash
mkdir -p ~/projects
echo 'MESSAGING_CWD=/home/hermes/projects' >> ~/.hermes/.env
systemctl --user restart hermes-gateway
```

## 6. Test

Message the Telegram bot. Hermes should respond.

If it does not respond, run:

```bash
hermes doctor
journalctl --user -u hermes-gateway -n 100 --no-pager
```

Next: [Operate and troubleshoot](06-operations.md)
