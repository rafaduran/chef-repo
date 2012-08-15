#!/usr/bin/env bash
set -eu

# This takes last digit from chef version; i.e.: 0.10.8 -> 8
VERSION=`chef-solo --version | awk -F. '{print $3}'`

# We need at least 0.10.10
if [[ "$VERSION" -lt 10 ]]; then
    gem update chef
fi
