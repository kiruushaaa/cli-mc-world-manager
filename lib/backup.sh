#!/bin/bash

B2_BUCKET="kp-minecraft-saves"
B2_WORLD_GZIP_KEY="our-cool-world.gz"

SAVES_PATH=~/Library/Application\ Support/minecraft/saves/
WORLD_SAVE_PATH=kirill

b2 rm b2://${B2_BUCKET}/${B2_WORLD_GZIP_KEY}

cd "$SAVES_PATH"
tar -czf - "$WORLD_SAVE_PATH" | b2 file upload "$B2_BUCKET" - "$B2_WORLD_GZIP_KEY"

echo -e "\n💋 Backup is on the storage, honey. K can play alone\n"
