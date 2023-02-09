#!/bin/bash

# Set database credentials
DB_NAME="singlishwords"
DB_USER="root"
DB_PASSWORD="d8sx9anc8asx"

# Set backup directory
BACKUP_DIR="/tmp/mysql_backups"

# Create backup directory if it does not exist
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi

# Set backup file name
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-$(date +%Y%m%d_%H%M%S).sql.gz"

# Set Docker container name
CONTAINER_NAME="deployment_mysql_1"

# Perform the backup
docker exec $CONTAINER_NAME mysqldump --user=$DB_USER --password=$DB_PASSWORD $DB_NAME | gzip > $BACKUP_FILE

# Check if backup was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully. File: $BACKUP_FILE"
else
  echo "Backup failed."
fi

