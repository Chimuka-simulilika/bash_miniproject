#!/usr/bin/bash

cd ../Data/

entry_count=$(cat humchrx.txt | cut -d' ' -f1 | tail -898 | head -890 |wc -l)
 #Counts the number of protein entries after trimming off other information 

echo "There are $entry_count protein entries" > ../results/protein_count.txt
