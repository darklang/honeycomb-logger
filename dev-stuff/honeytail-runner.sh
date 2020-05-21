#!/bin/bash

if [[ -z "$WRITEKEY" ]]; then
    echo "You must provide a WRITEKEY to run $(basename "$0")."
    exit 1
fi

honeytail \
  --api_host="http://localhost:8010" \
  --writekey="${WRITEKEY}" \
  --dataset="sandbox" \
  --parser=json \
  --file "$(dirname "$0")/sample-data.json" \
  --backfill
