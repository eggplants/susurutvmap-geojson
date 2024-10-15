#!/usr/bin/env bash

set -euxo pipefail

if ! command -v curl sed jq >/dev/null; then
  exit 1
fi

TODAY="susurutvmap-$(date +%Y-%m-%d)"

mkdir -p data/{,geo}json

curl -sL https://susurutvmap.com/index.php | sed -nr 's/const js_test = (.*);/\1/p' > data/json/"${TODAY}.json"
jq -f ./filter.jq "data/json/${TODAY}.json" > data/geojson/"${TODAY}.geojson"
