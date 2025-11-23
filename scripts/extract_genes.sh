#!/usr/bin/bash

cd ../Data/

cat humchrx.txt | cut -d' ' -f1 | tail -898 | head -890 |sort -u > ../results/gene_names_sorted.txt 


echo "Genes names sorted"
