# 01. Create a Hetzner Account

This step creates the Hetzner account that will own the VPS.

## 1. Open Hetzner Console

Go to:

```text
https://console.hetzner.com/
```

Choose sign up / register, then create a new account with the email address that should own the infrastructure.

## 2. Verify the Account

Hetzner usually requires email verification and may require identity, billing, or payment verification before servers can be created.

Complete every verification step shown in the account dashboard.

## 3. Add Billing

Add a valid payment method.

Do not create a server until billing is active, otherwise the create-server step may fail or remain blocked.

## 4. Enable Account Security

After the account is active:

1. Enable two-factor authentication.
2. Save backup codes in a secure password manager.
3. Use a strong unique password.
4. Avoid sharing the root Hetzner login.

## 5. Create a Cloud Project

In Hetzner Console:

1. Open Cloud.
2. Create a new project.
3. Name it clearly, for example:

```text
hermes-production
```

Use separate projects for production, staging, and experiments.

## 6. Add an SSH Key

On your local computer, check whether you already have an SSH key:

```bash
ls ~/.ssh
```

If you do not have one, create one:

```bash
ssh-keygen -t ed25519 -C "your-email@example.com"
```

Show the public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

In Hetzner Console:

1. Open the project.
2. Go to Security.
3. Go to SSH Keys.
4. Add the public key.
5. Give it a recognizable name, such as `ankit-laptop`.

Only paste the `.pub` public key into Hetzner. Never paste the private key.

## Done

You are ready to create the VPS.

Next: [Create a Cloud project and VPS](02-create-vps.md)

