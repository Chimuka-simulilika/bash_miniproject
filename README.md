# Bash Mini-Project: Genomic Data Analysis

## Student Information
**Name**: Chimuka Simulilika
**Student ID**: MB300-0005/2025
**Course**: PUB 3127 - Computing for Biologists
**Date Started**: [TODO: Date you started the project]
**Date Completed**: [TODO: Date you completed the project]

---

## Project Description
This project analyzes genomic scaffold data and protein database records using bash command-line tools. The analysis includes:
- Counting and filtering DNA sequences from FASTA files
- Identifying high-quality scaffolds based on length and coverage criteria
- Extracting and analyzing protein information from database files
- Automating bioinformatics workflows with bash scripts

---

## Repository Contents

```
bash_miniproject/
├── Data/                          # Input data files
│   ├── IP-004_S38_L001_scaffolds.fasta
│   └── humchrx.txt
├── scripts/                       # Bash scripts for analysis
│   └── [TODO: List your scripts here as you create them]
├── results/                       # Output files from analyses
│   └── [TODO: List your result files here as you generate them]
├── .gitignore                     # Git ignore rules
├── ASSIGNMENT.md                  # Assignment instructions
└── README.md                      # This file
```

---

## Requirements

### Software
- Bash shell (Linux, macOS, or WSL on Windows)
- Git and GitHub account
- Basic Unix tools: `grep`, `cut`, `sort`, `uniq`, `wc`, `head`, `tail`
- Text editor (nano, vim, VS Code, etc.)

### Data Files
The `Data/` directory contains:
1. **IP-004_S38_L001_scaffolds.fasta** (~10 MB) - Genomic scaffolds from sequencing assembly
2. **humchrx.txt** (~152 KB) - UniProt protein entries for human chromosome X

---

## Usage Instructions

### Setup
1. Clone this repository:
   ```bash
   git clone [YOUR_REPO_URL]
   cd bash_miniproject
   ```

2. Verify data files are present:
   ```bash
   ls -lh Data/
   ```

### Running the Scripts

[TODO: Add detailed instructions for each script as you create them. Example format below:]

#### Script 1: Extract Headers
```bash
./scripts/extract_headers.sh
```
**Purpose**: Extracts all sequence headers from the FASTA file
**Output**: `results/sequence_ids.txt` - List of NODE identifiers

#### Script 2: Find Longest Sequence
```bash
./scripts/longest_sequence.sh
```
**Purpose**: Identifies the scaffold with the longest sequence
**Output**: `results/longest_sequence.txt` - Details of the longest scaffold

#### Script 3: Filter by Length
```bash
./scripts/filter_by_length.sh 5000
```
**Purpose**: Filters scaffolds with length >= specified minimum
**Output**: `results/filtered_sequences.txt` - Filtered scaffold headers

#### Script 4: High-Quality Scaffolds
```bash
./scripts/high_quality_scaffolds.sh
```
**Purpose**: Identifies scaffolds meeting both length and coverage criteria
**Output**: `results/high_quality_scaffolds.txt` - High-quality scaffold list

#### Script 5: Extract Gene Names
```bash
./scripts/extract_genes.sh
```
**Purpose**: Extracts unique gene names from protein database
**Output**: `results/gene_names_sorted.txt` - Sorted unique gene names

#### Script 6: Search Proteins
```bash
./scripts/search_proteins.sh "kinase"
```
**Purpose**: Searches for proteins matching a keyword
**Output**: `results/protein_search_results.txt` - Matching protein entries

[TODO: Update the purpose and output descriptions based on your actual implementations]

### Running the Master Script
```bash
./scripts/run_analysis.sh ./Data/
```
**Purpose**: Runs all analyses in sequence and generates a comprehensive summary
**Output**:
- All result files from individual scripts
- `results/analysis_summary.txt` - Summary of all analyses with counts and timestamp

[TODO: Verify the above descriptions match your actual implementation]

---

## Analysis Results Summary

[TODO: Fill this section in after completing your analyses. Answer these questions:]

### FASTA File Analysis
- **Total number of sequences**: [TODO]
- **Longest sequence**: [TODO: NODE_X with length and coverage]
- **Number of sequences with length >= 5000**: [TODO]
- **Number of high-quality scaffolds** (length >= 10000, coverage >= 5.0): [TODO]

### Protein Database Analysis
- **Total protein entries**: [TODO]
- **Number of unique genes**: [TODO]
- **Example protein search result** (e.g., for "kinase"): [TODO: number of matches]

### Key Findings
[TODO: Write 2-3 sentences about interesting observations from your analysis]

---

## Scripts Description

[TODO: Provide a brief description of each script. Example format below:]

| Script Name | Purpose | Key Commands Used |
|-------------|---------|-------------------|
| `extract_headers.sh` | Extract NODE identifiers from FASTA file | grep, cut |
| `longest_sequence.sh` | Find the scaffold with the longest sequence | grep, sort, head |
| `filter_by_length.sh` | Filter scaffolds by minimum length | grep, cut, [loops] |
| `high_quality_scaffolds.sh` | Identify high-quality scaffolds | grep, cut, [conditionals] |
| `extract_genes.sh` | Extract unique gene names from protein file | cut, sort, uniq |
| `search_proteins.sh` | Search for proteins by keyword | grep |
| `run_analysis.sh` | Master script that runs all analyses | [calls all other scripts] |

---

## Challenges and Solutions

[TODO: Document any challenges you faced and how you solved them. This shows your problem-solving process. Example:]

**Challenge 1**: [TODO: Describe a problem you encountered]
**Solution**: [TODO: Describe how you solved it]

**Challenge 2**: [TODO]
**Solution**: [TODO]

---

## What I Learned

[TODO: Write a brief reflection (3-5 sentences) about what you learned from this project. Consider:]
- New bash commands or concepts you learned
- How command-line tools can be useful for bioinformatics
- Any insights about version control with Git
- How this project relates to your research interests

---

## References

- [Introduction to Linux Lectures](https://github.com/amelgh/Introduction_To_Linux/tree/master/Lectures)
- Course materials: PUB 3127 - Computing for Biologists
- Bash manual: `man bash`
- FASTA format: [https://en.wikipedia.org/wiki/FASTA_format](https://en.wikipedia.org/wiki/FASTA_format)

---

## License
This project is for educational purposes as part of PUB 3127 coursework.

---

## Acknowledgments
- **Instructor**: [TODO: Your instructor's name]
- **Institution**: [TODO: Your university/institution name]
- Data sources: [Sequencing data and UniProt database]
