#!/bin/bash

WATCH_PATH=~/Library/Application\ Support/minecraft/saves/kirill

echo -e "\n💋 Waiting for K to play alone...\n"

# `session.lock` is being changed on the world save event
fswatch -1 -e ".*" -i ".*\\.lock$" "$WATCH_PATH" | while read -r file; do
  ./lib/backup.sh
  break
done
