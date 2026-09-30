#!/bin/bash
#
# Creates DigitalOcean firewalls matching the default UI template.

set -euo pipefail

doctl compute firewall create \
  --name "cloud-sandbox-vpc-firewall" \
  --inbound-rules "protocol:tcp,ports:22,address:0.0.0.0/0" \
  --outbound-rules "protocol:icmp,address:0.0.0.0/0 protocol:tcp,ports:all,address:0.0.0.0/0 protocol:udp,ports:all,address:0.0.0.0/0" \
  --output json | jq
