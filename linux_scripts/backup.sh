#!/bin/bash

# Backup directory
BACKUP_DIR="$HOME/backups"
mkdir -p "$BACKUP_DIR"

# Timestamp for backup file
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Backup file path
BACKUP_FILE="$BACKUP_DIR/full_backup_$TIMESTAMP.tar.gz"

# Directories to backup
SRC="/etc/home"

# Create backup
echo "Creating backup of /etc and /home..."
sudo tar -czf "$BACKUP_FILE" $SRC

echo "Backup completed: $BACKUP_FILE"