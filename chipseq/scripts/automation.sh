#! /bin/bash

# Define the path to the fastq files
FASTQ="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/raw_data"

# Define the path to the fastqc files
FASTQC="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/fastqc"

while read -r LINE;
do
	echo "Processing $LINE"
	if [ ! -d $FASTQC/$LINE ]
	then
		mkdir $FASTQC/$LINE
	fi
	fastqc $FASTQ/$LINE/*.fastq.gz
	mv *fastqc* $FASTQC/$LINE
done<sra_files.txt
