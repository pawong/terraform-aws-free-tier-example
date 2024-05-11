# Terraform AWS Free Tier Example

Terraform AWS free tier only, free today, free tomorrow, free forever (or it won't work).

## Verify Changes

```bash
% cd terraform/main
% terraform init
% terraform validate
% terraform plan
```

## Apply Changes

```bash
% terraform apply
```
## Github Action Workflows

`deploy.yml` - Run Terraform to init, fmt, plan and apply.

## Pre-Commits

Run manually:

```bash
% pre-commit run -a
```
