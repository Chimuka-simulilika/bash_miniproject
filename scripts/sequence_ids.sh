#!/usr/bin/bash

cd ../Data/
cat IP-004_S38_L001_scaffolds.fasta | grep ">" | cut -d'>' -f2 | cut -d'_' -f1,2 > ../results/sequence_ids.txt
count=$(cat IP-004_S38_L001_scaffolds.fasta | grep ">" | wc -l)

echo "Extracted $count sequence identifiers"
