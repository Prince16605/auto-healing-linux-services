# Auto-Healing Linux Services

## Project Overview
Monitors Nginx on three Linux managed nodes.
If Nginx stops, a Bash script attempts to restart it and logs the result.

## Architecture
- 1 Ansible Control Node
- 3 Linux Managed Nodes
- Bash health-check script
- systemd service and timer
- Ansible ad-hoc commands

## Technologies
AWS EC2, Linux, Ansible, Bash, systemd, Nginx, SSH

## Features
- Nginx health check
- Automatic restart attempt
- Scheduled monitoring
- Recovery logs
