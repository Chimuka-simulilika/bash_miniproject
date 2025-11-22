#!/usr/bin/bash

cd ../Data/
long=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2 | cut -d'_' -f4 | sort -n | tail -1)

cov=$(grep "length_$long" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2 | cut -d'_' -f6)
node=$(grep "length_$long" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2 | cut -d'_' -f1,2)

echo "Longest sequence: $node" > ../results/longest_sequence.txt
echo "Length: $long" >> ../results/longest_sequence.txt
echo "Coverage: $cov" >> ../results/longest_sequence.txt
