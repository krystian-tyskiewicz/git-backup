#!/bin/bash

BACKUP_FILE="backup.tar.gz"

case "$1" in
  create)
    git ls-files --modified --others --exclude-standard | tar -czf "$BACKUP_FILE" -T -
    echo "Backup saved as $BACKUP_FILE"
    ;;
  
  restore)
    if [ -f "$BACKUP_FILE" ]; then
      tar -xzf "$BACKUP_FILE"
      echo "Backup restored."
    else
      echo "Backup file $BACKUP_FILE not found."
    fi
    ;;

  *)
    echo "Usage: $0 {create|restore}"
    ;;
esac
