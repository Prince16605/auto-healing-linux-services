#!/bin/bash

SERVICE="nginx"
LOG="/var/log/auto-heal-nginx.log"
TIME=$(date '+%Y-%m-%d %H:%M:%S')

log() {
    echo "[$TIME] $1" | tee -a "$LOG"
}

if systemctl is-active --quiet "$SERVICE"; then
    log "OK: nginx is running"
    exit 0
fi

log "WARNING: nginx is stopped. Restarting..."

if systemctl restart "$SERVICE"; then
    sleep 2
    if systemctl is-active --quiet "$SERVICE"; then
        log "RECOVERED: nginx restarted successfully"
        exit 0
    fi
fi

log "CRITICAL: nginx restart failed"
exit 1
