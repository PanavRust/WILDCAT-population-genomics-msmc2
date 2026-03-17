#!/bin/bash

# Run MSMC2

set -e

INPUT=$1
OUTPUT=$2

if [ -z "$INPUT" ] || [ -z "$OUTPUT" ]; then
    echo "Usage: run_msmc2.sh <input> <output_prefix>"
    exit 1
fi

msmc2 \
    -t 4 \
    -o $OUTPUT \
    $INPUT

echo "MSMC2 complete"
