#!/bin/bash
#
# Creates DigitalOcean VPCs.

set -euo pipefail

doctl vpcs create \
  --description 'VPC for the cloud sandbox project.' \
  --ip-range 10.128.10.0/24 \
  --name 'cloud-sandbox-vpc' \
  --region lon1 \
  --output json | jq
