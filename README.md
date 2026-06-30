# Hermes Agent on Hetzner VPS

This repository is a step-by-step runbook for setting up Hermes Agent on a Hetzner Cloud VPS.

It starts from zero: creating a Hetzner account, creating a Cloud project, provisioning a VPS, locking down SSH/firewall access, installing the Hermes agent, and running it as a long-lived `systemd` service.

> Note: This guide avoids committing private keys, API keys, bot tokens, or server secrets. Keep real credentials on the VPS only.

The core install flow follows this community guide:

https://www.reddit.com/r/hermesagent/comments/1t2raft/complete_guide_how_to_host_hermes_agent_on_a/

## Who this is for

- Someone setting up Hermes on Hetzner for the first time.
- Someone recreating an existing Hermes agent setup on a fresh VPS.
- A teammate who needs a repeatable checklist instead of tribal knowledge.

## Our Hetzner Choice

For this setup, we used a cost-optimized Hetzner Cloud plan:

- Provider: Hetzner Cloud
- OS: Ubuntu 24.04 LTS
- Architecture: x86
- Plan: CX33
- Location: Helsinki, Finland (`hel1`)
- Access: SSH key only

## Setup Flow

0. [Current setup notes](docs/00-current-setup.md)
1. [Create a Hetzner account](docs/01-hetzner-account.md)
2. [Create a Cloud project and VPS](docs/02-create-vps.md)
3. [SSH and prepare the VPS](docs/03-ssh-and-prepare-vps.md)
4. [Install Hermes Agent](docs/04-install-hermes-agent.md)
5. [Set up Telegram and Gateway](docs/05-telegram-and-gateway.md)
6. [Operate and troubleshoot](docs/06-operations.md)

## Folder Layout

```text
.
├── README.md
├── config-examples/
│   └── hermes.env.example
├── assets/
│   └── model-selection-openai-codex.svg
├── docs/
│   ├── 01-hetzner-account.md
│   ├── 00-current-setup.md
│   ├── 02-create-vps.md
│   ├── 03-ssh-and-prepare-vps.md
│   ├── 04-install-hermes-agent.md
│   ├── 05-telegram-and-gateway.md
│   └── 06-operations.md
└── scripts/
    ├── check-server.sh
    └── install-base-packages.sh
```

## Values to Collect Before You Start

Fill these in privately while following the guide:

```text
Hetzner account email:
Hetzner project name:
Server public IPv4:
Server public IPv6:
SSH username:
Hermes repository URL:
Hermes install command:
Hermes start command:
Hermes environment variables:
```

## Never Commit

Do not commit these files or values:

- `.env`
- private SSH keys
- wallet/private keys
- API tokens
- seed phrases/mnemonics
- production server IPs if the repo is public
