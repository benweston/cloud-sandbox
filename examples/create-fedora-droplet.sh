#!/usr/bin/env bash
# --------------------------------------------------- #
#   Creates a DigitalOcean droplet.                   #
#   Author: Ben Weston https://github.com/benweston   #
# --------------------------------------------------- #

set -euo pipefail

SSH_KEY_NAME="droplet-ssh"
SSH_KEY_ID=$(doctl compute ssh-key list \
    --output json \
    | jq -r --arg name "$SSH_KEY_NAME" '.[] | select(.name == $name) | .id')

if [ -z "$SSH_KEY_ID" ] || [ "$SSH_KEY_ID" = "null" ]; then
    echo "Error: SSH key '$SSH_KEY_NAME' not found in your DigitalOcean account." >&2
    exit 1
fi

doctl compute droplet create dev-droplet-fedora \
    --droplet-agent=true \
    --image fedora-44-x64 \
    --region lon1 \
    --size s-2vcpu-4gb \
    --ssh-keys "$SSH_KEY_ID" \
    --format ID,Name
