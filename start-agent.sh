#!/bin/bash

# Run Datadog Docker Agent
# Adapted from: https://docs.datadoghq.com/agent/docker/?tab=standard

set -eou pipefail

DATADOG_PROXY_URL="https://$DATADOG_PROXY_AUTH@datadog-proxy.opensafely.org:443"

# Note: double leading slashes below are to workaround git-bash weirdness on
# Windows
exec docker run -d --name dd-agent \
  -v //var/run/docker.sock:/var/run/docker.sock:ro \
  -v //proc/:/host/proc/:ro \
  -v //sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
  -e DD_API_KEY="$DATADOG_API_KEY" \
  -e DD_ENV="$BACKEND" \
  -e DD_PROXY_HTTP="$DATADOG_PROXY_URL" \
  -e DD_PROXY_HTTPS="$DATADOG_PROXY_URL" \
  ghcr.io/opensafely-core/datadog-agent
