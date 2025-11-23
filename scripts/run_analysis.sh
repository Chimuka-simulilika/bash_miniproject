#!/usr/bin/bash

#Written by Chimuka Simulilika
#Date:23/11/2025
#This is a Master Script
#This script is for analysis of FASTA files,Sequence filtering and Protein database analysis
#The scripts takes path to the data directory as an argument


#Check if the PATH was provided

if [ $# -eq 0 ]; then 
	echo "Error: No such directory found"
	echo "Syntax: ./analysis.sh /PATH/to/directory"
	exit 1
fi

#Variable below stores the accepted output from the first commad/argument
mini_project_data_directory="$1"

#Checks if the argument passed is a valid directory
if [ ! -d "$mini_project_data_directory" ]; then
	echo "Error: No such directory found"
	exit 1
fi

#Changes to the mini_project_data-directory

cd $mini_project_data_directory

#Checks if required imput failes are there in the directory
required_files=("IP-004_S38_L001_scaffolds.fasta" "humchrx.txt") #Checks to find the required file
missing_file=() #empty variable for missing files

#Checks if the file is availabe in the directory
for file in "${required_files[@]}"; do
	[ ! -f "$mini_project_data_directory/$file" ] && missing_file+=("$file")
done 

if [ ${#missing_file[@]} -gt 0 ]; then
	echo "Error: Missing file/File not found: ${missing_file[*]}"
	exit 1
fi

#Create results directory for outputs
mkdir ../results
echo "results directory created..."

#FASTA file exploration
#This section counts the number of sequences, extract their sequence headers and find th elongest sequence
#Output will be saved in the results directory

#Extracrtion and counting of sequences
grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2 | cut -d'_' -f1,2 > ../results/sequence_ids.txt
extracted_count=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2 | cut -d'_' -f1,2 | wc -l)
echo "$extracted_count sequences counted"
echo "Extracted $extracted_count sequence identifiers"

#Finding the longest sequence in the FASTA file

#indentifies the longest sequence, its node, its coverage and saves the output to the provided directory
long=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2 | cut -d'_' -f4 | sort -n | tail -1)
cov=$(grep "length_$long" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2 | cut -d'_' -f6)
node=$(grep "length_$long" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2 | cut -d'_' -f1,2)

echo "Longest sequence: $node" > ../results/longest_sequence.txt
echo "Length: $long" >> ../results/longest_sequence.txt
echo "Coverage: $cov" >> ../results/longest_sequence.txt
echo "Longest sequence found"

#Sequence filtering and statistics

#Filtering the sequences by their length
minimum_length=5000 #Created the variable to hold the minimum length

length_list=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4) #Created the list of sequences by length

#Created a loop with an if statement to check if the length meets the minimum length
for length in $length_list; do
	if [ "$length" -ge "$minimum_length" ]; then 
		grep "length_$length" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4 >> ../results/filtered_sequences.txt
	fi
done

#counting the number of generated sequences by minimum length
sequence_count=$(cat ../results/filtered_sequences.txt | wc -l)

echo "Found $sequence_count sequences with >= 5000 bases"


#Selecting high quality scaffolds
#The selection is based on the lenth and the coverage

minimum_length=10000
minimum_coverage=5.0


length_list=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4)
 #Generation of sequence lengths list

for length in $length_list; do 
        if [ "$length" -ge "$minimum_length" ]; then 
                cov=$(grep "length_$length" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f6)
		if [ -n "$cov" ] && [ $(echo "$cov >= $minimum_coverage" | bc -l) -eq 1 ]; then  
			grep "length_$length" IP-004_S38_L001_scaffolds.fasta >> ../results/high_quality_scaffolds.txt
		fi
		
        fi
done

sequence_count=$(cat ../results/high_quality_scaffolds.txt | wc -l)

echo "Found $sequence_count sequences high quality scaffolds"
minimum_length=10000
minimum_coverage=5.0


length_list=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4)
 #Generation of sequence lengths list

for length in $length_list; do 
        if [ "$length" -ge "$minimum_length" ]; then 
                cov=$(grep "length_$length" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f6)
		if [ -n "$cov" ] && [ $(echo "$cov >= $minimum_coverage" | bc -l) -eq 1 ]; then  
			grep "length_$length" IP-004_S38_L001_scaffolds.fasta >> ../results/high_quality_scaffolds.txt
		fi
		
        fi
done

sequence_count=$(cat ../results/high_quality_scaffolds.txt | wc -l)

echo "Found $sequence_count sequences high quality scaffolds"


#Protein Database Analysis

#Protein entry count
#Counts the number of proteins recorded in the file
entry_count=$(cat humchrx.txt | cut -d' ' -f1 | tail -898 | head -890 |wc -l)
 #Counts the number of protein entries after trimming off other information 

echo "There are $entry_count protein entries" > ../results/protein_count.txt

#Extracting genes from the database
#also sorts the genes names in alpabetical order
cat humchrx.txt | cut -d' ' -f1 | tail -898 | head -890 |sort -u > ../results/gene_names_sorted.txt 
echo "Genes names sorted"

#Searching for specific proteins

search_word=Kinase

cat humchrx.txt | grep -i "$search_word" | cut -c33-45,63- > ../results/protein_search_results.txt
#specifies where to cut 

entry_count=$(cat humchrx.txt | grep -i "$search_word" | cut -c33-45,63- | wc -l) 
#counts protein entries required

echo "There are $entry_count Kinase hits"

#Analysis Summary

touch ../results/analysis_summary.txt
echo "The total number of sequences in the FASTA file is: $extracted_count" ../results/analysis_summary.txt
echo "The counted high quality scaffolds among the sequences is: $sequence_count" ../results/analysis_summary.txt
echo "The counted protein entries in the database is: $entry_count"

echo "ANALYSIS DONE"
