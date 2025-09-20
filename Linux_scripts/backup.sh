#!/bin/bash
# backup-etc.sh - Backup /etc directory

BACKUP_DIR="$HOME/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
SRC="/etc"
DEST="$BACKUP_DIR/etc_backup_$TIMESTAMP.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create the backup
tar -czf "$DEST" "$SRC"

echo "Backup of /etc completed: $DEST"
