#!/usr/bin/env bash
set -euo pipefail

# This script is designed to be run as root (there are no sudo commands)
# It is idempotent, so can be re-run if needed.

# Increase maximum number of inotify instances; occasionally hitting the limit in development.
cat > "/etc/sysctl.d/50-inotify.conf" << 'EOF'
fs.inotify.max_user_instances=512
fs.inotify.max_user_watches=524288
EOF

sysctl -p /etc/sysctl.d/50-inotify.conf
