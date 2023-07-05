#! /bin/bash
# This script used to run callpeak in macs2

# Define path to the bam files
CASE_BAM="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/bowtie/SRR12490775/SRR12490775_sorted.bam"
CTRL_BAM="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/bowtie/SRR12490774/SRR12490774_sorted.bam"

# Define path to the outputs
COMPARE_OUT="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/macs2/CaseVsCtrl"
CASE_OUT="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/macs2/SRR12490775"
CTRL_OUT="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/macs2/SRR12490774"

# Check if the output directories exist or not. If not, create one
if [ ! -d $COMPARE_OUT ]
then
	mkdir -p $COMPARE_OUT
fi

if [ ! -d $CASE_OUT ]
then 
	mkdir -p $CASE_OUT
fi

if [ ! -d $CTRL_OUT ]
then
	mkdir -p $CTRL_OUT
fi

# First, simply run callpeak with SRR12490774 as the control, and SRR12490775 as the case
macs2 callpeak \
-t $CASE_BAM \# define the case bam file
-c $CTRL_BAM \# define the control bam file
-f BAM \# specify inputs are bam files
-g 2.45e9 \# mappable genome size of hg19
-n peaks \# output prefix
--outdir $COMPARE_OUT

# Then, run callpeak with SRR12490774 and SRR12490775 separately
macs2 callpeak \
-t $CASE_BAM \
-f BAM \
-g 2.45e9 \
-n case_peaks \
--outdir $CASE_OUT

macs2 callpeak \
-t $CTRL_BAM \
-f BAM \
-g 2.45e9 \
-n ctrl_peaks \
--outdir $CTRL_OUT




