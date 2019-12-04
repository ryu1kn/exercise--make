#!/bin/bash

set -euo pipefail

secret_template=$1

shift

secrets=$(for secret_path in "$@" ; do
    echo "  $(basename $secret_path): \"$(< $secret_path)\""
done)

perl -p0e "s|__SECRETS__|$secrets|" "$secret_template"
