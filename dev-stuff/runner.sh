#!/bin/bash

if [[ -z "$WRITEKEY" ]]; then
    echo "You must provide a WRITEKEY to run $(basename "$0")."
    exit 1
fi

dirname="$(dirname "$(realpath "$0")")"

exec docker run \
    -e WRITEKEY="${WRITEKEY}" \
    -e DATASETS_TO_LOG='sandbox|some-other-dataset' \
    -w /root \
    -v "${dirname}/installer.sh":/root/installer.sh \
    -v "${dirname}/sample-data.json":/root/sample-data.json \
    -v "${dirname}/honeytail-runner.sh":/root/honeytail-runner.sh \
    -it honeycomb-logger:latest
