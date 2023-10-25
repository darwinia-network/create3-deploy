#!/usr/bin/env bash

set -eo pipefail

create3=0x009dE19E34bEcDF5712f65526d8B94699B3dbD3c

verify() {
  local addr; addr=$1
  local path; path=$2
  local name; name=${path#*:}
  (set -x; forge verify-contract \
    --num-of-optimizations 999999 \
    --watch \
    --etherscan-api-key $ETHERSCAN_API_KEY \
    --compiler-version v0.8.17+commit.8df45f5f \
    --show-standard-json-input \
    $addr \
    $path > script/$name.v.json)
}

verify $create3 src/CREATE3Factory.sol:CREATE3Factory
