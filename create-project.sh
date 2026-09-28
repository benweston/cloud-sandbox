#!/bin/bash
#
# Creates a DigitalOcean project.

set -euo pipefail

doctl projects create \
  --name 'Cloud Sandbox' \
  --environment 'Development' \
  --purpose 'Class project / Educational purposes' \
  --description 'Ephemeral cloud infrastructure and sandbox environments for experimentation and learning.' \
  --output json | jq
