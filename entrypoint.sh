#!/bin/bash
# set -e は　「エラーが発生するとスクリプトを終了する」オプション
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"