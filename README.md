# Minecraft Save Sync

This is a simple bash script to sync Minecraft saves from a local machine to `Backblaze B2`

## Requirements

- MacOS (`nbt2json` binary is built for MacOS)
- Backblaze B2 bucket
- Minecraft installed on the local machine

### How To Use

1. Clone the repo
2. Make files executable if they are not
   ```bash
   find ./cli-mc-world-manager/ -type f ! -name ".*" -exec chmod +x {} \;
   ```
3. Edit the `*.sh` files to add your Backblaze B2 bucket name and the name of your Minecraft save
4. Put `nbt2json` to your `minecraft/saves` folder
   ```bash
   CMND + Shift + G => ~/Library/Application Support/minecraft/saves
   ```

The script `sync-world.sh` will download the Minecraft save from Backblaze B2, replace the local save with the downloaded one and remove player data from `local.dat`. The local save will be moved to the `/world-snapshots/` directory.
