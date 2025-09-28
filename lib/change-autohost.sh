#!/bin/bash

# TODO not done yet

tmpfile=$(mktemp)
jq --argjson value $1 '.worldSettings.autoHostOnJoin = $value' ${CONFIG_PATH} > "$tmpfile"
mv "$tmpfile" ${CONFIG_PATH}
