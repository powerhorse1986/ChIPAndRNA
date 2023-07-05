#! /bin/bash
# This file will generate gene quants using salmon

# Define the path to the salmon index
INDEX_PATH="/home/mali/NewDrive/Practice/ChIPAndRNA/reference_data/index/salmon"

# Define the path to the reference genome
REF="/home/mali/NewDrive/Practice/ChIPAndRNA/reference_data/ref/genome.fa"

# Claim the path to the fastq files
FASTQ="/home/mali/NewDrive/Practice/ChIPAndRNA/rnaseq/raw_data"

# Check if this directory exist or not. If not, create one
if [ ! -d $INDEX_PATH ]
then
	echo "Create $INDEX_PATH"
	mkdir -p $INDEX_PATH
fi

# Generate salmon index
salmon index -t $REF -i $INDEX_PATH

# Salmon quantification!!! Faster than STAR
while read -r LINE;
do
	echo "Quanting $LINE"

	# Define the output path. And create one if the path does not exist
	OUT="/home/mali/NewDrive/Practice/ChIPAndRNA/rnaseq/results/salmon/$LINE"
	if [ ! -d $OUT ]
	then
		echo "Create $OUT"
		mkdir -p $OUT
	fi

	salmon quant \
	-i $INDEX_PATH \
	-l A \
	-1 $FASTQ/$LINE/*_1.fastq.gz \
	-2 $FASTQ/$LINE/*_2.fastq.gz \
	-p 8 \
	--validateMappings \
	-o $OUT 

done<sra_files.txt
