In your home directory, create the file backup.sh with the following content:
```bash
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
```

Grant appropriate permissions:
```
chmod +x backup.sh
```

To create a backup, run (this will create a backup `backup.tar.gz`):
```
~/backup.sh create
```

To restore a backup, run:
```
~/backup.sh restore
```
