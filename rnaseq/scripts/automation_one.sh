#! /bin/bash
# This script runs rna-seq analysis pipeline (from fastq file to gene counts).
# Step one, run fastqc on all the fastq files
# Step two, align the fastq files using STAR
# Step three, generate gene counts using htseq-count

# Define the path to fastq files
FASTQ_PATH="/home/mali/NewDrive/Practice/ChIPAndRNA/rnaseq/raw_data"

# Define the path to fastqc files
FASTQC_PATH="/home/mali/NewDrive/Practice/ChIPAndRNA/rnaseq/results/fastqc"

# Define the path to STAR index
INDEX_PATH="/home/mali/NewDrive/Practice/ChIPAndRNA/reference_data/index/STAR"

# Define the path to gtf file
GTF="/home/mali/NewDrive/Practice/ChIPAndRNA/reference_data/gtf/Homo_sapiens.GRCh37.87.gtf"

while read -r LINE;
do
	echo "Processing $LINE"
        
        # Check if the path to fastqc file exists or not, if there is no such a directory, then create one
        if [ ! -d $FASTQC_PATH/$LINE ]
	then
	        echo "Create $FASTQC_PATH/$LINE"
	        mkdir -p $FASTQC_PATH/$LINE
	fi
        
	# Run fastqc on corresponding fastq file and move the fastqc files to designated directory
	#/home/mali/Software/pipeline/FastQC/fastqc $FASTQ_PATH/$LINE/*fastq.gz
	#mv $FASTQ_PATH/$LINE/*fastqc* $FASTQC_PATH/$LINE
        
	# Claim the path to the folder where to store the output from STAR aligner
	OUT_PATH="/home/mali/NewDrive/Practice/ChIPAndRNA/rnaseq/results/STAR/$LINE/"
	# If the output path does not exist, create one
	if [ ! -d $OUT_PATH ]
	then
		echo "Create $OUT_PATH"
		mkdir -p $OUT_PATH
	fi

	# Align the reads
        STAR --runThreadN 16 \
	--genomeDir $INDEX_PATH \
	--readFilesCommand zcat \
	--readFilesIn $FASTQ_PATH/$LINE/*1.fastq.gz $FASTQ_PATH/$LINE/*2.fastq.gz \
	--outFileNamePrefix $OUT_PATH \
	--outSAMtype BAM SortedByCoordinate \
	--outSAMunmapped Within \
	--outSAMattributes Standard
	
	# Build index for the bam file
	samtools index $OUT_PATH/*.out.bam

	# Counting reads per feature
	echo "Counting $LINE"
	htseq-count \
	-f bam \
	-m union \
	-t exon \
	-i gene_id \
	$OUT_PATH/*.out.bam \
	$GTF \
	> $LINE.count

	mv $LINE.count /home/mali/NewDrive/Practice/ChIPAndRNA/rnaseq/results/STAR/counts
done<sra_files.txt
