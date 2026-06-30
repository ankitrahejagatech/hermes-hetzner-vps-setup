# 05. Set Up Telegram and Gateway

This section follows the Hermes Agent VPS guide after `hermes setup` is complete.

Source guide:

```text
https://www.reddit.com/r/hermesagent/comments/1t2raft/complete_guide_how_to_host_hermes_agent_on_a/
```

## 1. Create a Telegram Bot

In Telegram:

1. Message `@BotFather`.
2. Run `/newbot`.
3. Follow the prompts.
4. Copy the bot token.

## 2. Get Your Telegram User ID

In Telegram:

1. Message `@userinfobot`.
2. Copy your numeric user ID.

## 3. Add Telegram Values

Open the Hermes environment file:

```bash
nano ~/.hermes/.env
```

Add:

```text
TELEGRAM_BOT_TOKEN=your_bot_token_here
TELEGRAM_ALLOWED_USERS=your_numeric_user_id_here
```

Save the file.

## 4. Lock the Environment File

```bash
chmod 600 ~/.hermes/.env
```

## 5. Set Up the Gateway

```bash
hermes gateway setup
```

```bash
hermes gateway install
```

## 6. Start the Gateway

```bash
systemctl --user enable --now hermes-gateway
```

## 7. Check the Gateway

```bash
systemctl --user status hermes-gateway
```

```bash
journalctl --user -u hermes-gateway -f
```

## 8. Test From Telegram

Send a message to your Telegram bot.

Hermes should respond from the VPS.

Next: [Operate and troubleshoot](06-operations.md)

