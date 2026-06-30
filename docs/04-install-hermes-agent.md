# 04. Install Hermes Agent

This step installs Hermes Agent on the VPS.

The install command follows the community guide:

```text
https://www.reddit.com/r/hermesagent/comments/1t2raft/complete_guide_how_to_host_hermes_agent_on_a/
```

## 1. SSH Into the Server

```bash
ssh hermes@<your-server-ip>
```

## 2. Run the Official Installer

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
```

Reload your shell:

```bash
source ~/.bashrc
```

## 3. Verify Hermes

```bash
hermes --version
hermes doctor
```

## 4. Run Setup

Run:

```bash
hermes setup
```

Use the setup wizard to configure your LLM provider and API key.

For VPS safety, set approval mode to ask:

```bash
hermes config set approval_mode ask
```

## 5. Add Telegram

If you want to use Hermes from your phone:

1. In Telegram, message `@BotFather`.
2. Create a bot with `/newbot`.
3. Save the bot token privately.
4. Message `@userinfobot`.
5. Save your numeric Telegram user ID.

Edit Hermes env:

```bash
nano ~/.hermes/.env
```

Add:

```text
TELEGRAM_BOT_TOKEN=your_token_here
TELEGRAM_ALLOWED_USERS=your_numeric_user_id_here
```

Lock the file:

```bash
chmod 600 ~/.hermes/.env
```

Next: [Run Hermes persistently](05-systemd-service.md)
