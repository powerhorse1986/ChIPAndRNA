#! /bin/bash
# This script aims to create index for STAR aligner

# Specify the path to the directory where the index stored
INDEX_PATH="/home/mali/NewDrive/Practice/ChIPAndRNA/reference_data/index/STAR"

# If this directory does not exist, create one
if [ ! -d $INDEX_PATH ]
then
	mkdir -p $INDEX_PATH
fi

# Claim the path to the reference genome fasta file
REF_PATH="/home/mali/NewDrive/Practice/ChIPAndRNA/reference_data/ref/genome.fa"

# Claim the path to the gtf file
GTF_PATH="/home/mali/NewDrive/Practice/ChIPAndRNA/reference_data/gtf/Homo_sapiens.GRCh37.87.gtf"

# Run the command for creating STAR index
STAR --runThreadN 12 \
--runMode genomeGenerate \
--genomeDir $INDEX_PATH \
--genomeFastaFiles $REF_PATH \
--sjdbGTFfile $GTF_PATH \
--sjdbOverhang 149
