#!/bin/bash

# Generate callable genome mask

set -e

BAM=$1
OUTPUT_PREFIX=$2

if [ -z "$BAM" ] || [ -z "$OUTPUT_PREFIX" ]; then
    echo "Usage: generate_masks.sh <bam> <output_prefix>"
    exit 1
fi

echo "Calculating coverage..."
samtools depth -a $BAM > ${OUTPUT_PREFIX}.depth.txt

echo "Generating mask..."
awk '$3 >= 10 && $3 <= 100 {print $1"\t"$2-1"\t"$2}' ${OUTPUT_PREFIX}.depth.txt > ${OUTPUT_PREFIX}.mask.bed

echo "Mask generated"
