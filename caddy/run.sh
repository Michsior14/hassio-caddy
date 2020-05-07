#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
CADDY_SHARE_PATH="/share/caddy"

DEFAULT_ARGS=( "" )
readarray -t FLAGS < <(jq --raw-output '.flags[]' $CONFIG_PATH)
readarray -t ENV_VARS < <(jq --raw-output '.env_vars[]' $CONFIG_PATH)

if [ -f "$CADDY_SHARE_PATH/caddy.bin" ]; then
    CADDY_PATH="$CADDY_SHARE_PATH/caddy.bin"
    echo "Found Caddy: $($CADDY_PATH -version)"
    echo "Running Caddy: ${ENV_VARS[*]} $CADDY_PATH ${DEFAULT_ARGS[*]} ${FLAGS[*]}"
    exec env -S "${ENV_VARS[*]}" $CADDY_PATH ${DEFAULT_ARGS[*]} ${FLAGS[*]}
else
    echo "No Caddy binary provided"
fi

