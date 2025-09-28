#!/bin/bash

# storage
B2_BUCKET="kp-minecraft-saves"
B2_WORLD_GZIP_KEY="our-cool-world.gz"
# local temp gzip
DOWNLOAD_FILE_NAME="world.gz"
# main saves dir
SAVES_PATH=~/Library/Application\ Support/minecraft/saves/
WORLD_SAVE_PATH=kirill
LUNAR_HOST_CONFIG=lunar_hosted_world_data.json

cd "$SAVES_PATH"

# download world
b2 file download b2://${B2_BUCKET}/${B2_WORLD_GZIP_KEY} ${DOWNLOAD_FILE_NAME}

# replace locally saved world
rm -r ${WORLD_SAVE_PATH}
tar -xf ${DOWNLOAD_FILE_NAME}
rm  ${DOWNLOAD_FILE_NAME}

# remove `Player` from `level.dat`
./nbt2json -b -i ${WORLD_SAVE_PATH}/level.dat \
  | jq 'del(.nbt[0].value[0].value[] | select(.name == "Player"))' \
  | ./nbt2json -r -z -b -i - -o ${WORLD_SAVE_PATH}/level.dat

# TODO disable auto host
# if [ "$1" = "--no-host" ]; then
#   CONFIG_PATH=${WORLD_SAVE_PATH}/${LUNAR_HOST_CONFIG} ./lib/change-autohost.sh true

#   echo -e "\n💋 Disabled the auto hosting of the local world, honey"
# fi

echo -e "\n💋 Synced from storage, honey\n"
