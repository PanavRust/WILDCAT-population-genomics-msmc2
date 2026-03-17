#!/bin/bash

# Convert VCF to MSMC2 input

set -e

VCF=$1
MASK=$2
OUTPUT=$3

if [ -z "$VCF" ] || [ -z "$MASK" ] || [ -z "$OUTPUT" ]; then
    echo "Usage: prepare_input.sh <vcf> <mask> <output>"
    exit 1
fi

if [ ! -f "${VCF}.tbi" ]; then
    tabix -p vcf $VCF
fi

generate_multihetsep.py \
    --mask=$MASK \
    $VCF > $OUTPUT

echo "Input prepared"
