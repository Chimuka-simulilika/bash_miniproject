#!/usr/bin/bash

cd ../Data/

minimum_length=$1

length_list=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4)

for length in $length_list; do
	if [ "$length" -ge "$minimum_length" ]; then 
		grep "length_$length" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4 >> ../results/filtered_sequences.txt
	fi
done

sequence_count=$(cat ../results/filtered_sequences.txt | wc -l)

echo "Found $sequence_count sequences with >= 5000 bases"

