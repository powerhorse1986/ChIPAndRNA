#! /bin/bash

# This script created to handle the narrowPeak files generated by macs2

# Define the path to the peak files
COMPARE_PEAK="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/macs2/CaseVsCtrl/peaks_peaks.narrowPeak"
CASE_PEAK="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/macs2/SRR12490775/case_peaks_peaks.narrowPeak"
CTRL_PEAK="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/macs2/SRR12490774/ctrl_peaks_peaks.narrowPeak"

# Define the path to the filtered peak files
FILTERED_COMPARE="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/macs2/CaseVsCtrl/compare_peaks_filtered.bed"
FILTERED_CASE="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/macs2/SRR12490775/case_peaks_filtered.bed"
FILTERED_CTRL="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/macs2/SRR12490774/ctrl_peaks_filtered.bed"

# Claim the path to the blacklist bedfile
BLACKLIST="/home/mali/NewDrive/Practice/ChIPAndRNA/reference_data/blacklist/hg19-blacklist.v2.bed"

# Filter the peaks against the blacklist bed file
#bedtools intersect \
#-v \
#-a $COMPARE_PEAK \
#-b $BLACKLIST \
#> $FILTERED_COMPARE

#bedtools intersect \
#-v \
#-a $CASE_PEAK \
#-b $BLACKLIST \
#> $FILTERED_CASE

#bedtools intersect \
#-v \
#-a $CTRL_PEAK \
#-b $BLACKLIST \
#> $FILTERED_CTRL

# Find the overlapping peaks between the case and control
#bedtools intersect \
#-wo -f 0.3 -r \
#-a $CASE_PEAK \
#-b $CASE_PEAK \
#> /home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/macs2/peaks_final.bed

# Index the bam files using samtools
samtools index \
/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/bowtie/SRR12490774/SRR12490774_sorted.bam

samtools index \
/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/bowtie/SRR12490775/SRR12490775_sorted.bam

# Generate bigwig file using bamCompare from package deepTools
bamCompare \
-b1 /home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/bowtie/SRR12490774/SRR12490774_sorted.bam \
-b2 /home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/bowtie/SRR12490775/SRR12490775_sorted.bam \
-o /home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/visualization/bigwigs/generatedByDeepTools/compare.bw \
--binSize 20
