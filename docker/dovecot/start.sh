#!/bin/bash
set -e

echo "Starting Dovecot service..."

# Wait for DB to be ready
echo "Waiting for MySQL database..."
while ! nc -z db 3306; do
  sleep 1
done
echo "MySQL is up, configuring Dovecot..."

# Ensure vmail directory has correct permissions
mkdir -p /var/mail/vhosts
chown -R vmail:vmail /var/mail/vhosts

# Start Dovecot in foreground
exec /usr/sbin/dovecot -F
