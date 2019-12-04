#!/bin/bash

set -euo pipefail

for manifest in "$@" ; do
    echo '---'
    cat "$manifest"
done
