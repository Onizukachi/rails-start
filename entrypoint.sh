#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
if [ -f /rails_app/tmp/pids/server.pid ]; then
  rm /rails_app/tmp/pids/server.pid
fi

rails db:prepare

# Then exec the container's main process (what's set as CMD in the Dockerfile).

echo "Starting rails app server ..."

exec "$@"