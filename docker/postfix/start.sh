#!/bin/bash
set -e

echo "Starting Postfix service..."

# Wait for DB to be ready
echo "Waiting for MySQL database..."
while ! nc -z db 3306; do
  sleep 1
done
echo "MySQL is up, configuring Postfix..."

# Ensure mail spool directories exist
mkdir -p /var/spool/postfix /var/mail
chown -R postfix:postfix /var/spool/postfix

# Start syslog for logging
rsyslogd

# Start Postfix in foreground
postfix start-fg
