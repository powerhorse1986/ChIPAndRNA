#! /bin/bash
# This script helps visualizing the .bw data

# Define the path to the bigwig files
CASE_BW="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/visualization/bigwigs/generatedByDeepTools/SRR12490775.bw"
CTRL_BW="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/visualization/bigwigs/generatedByDeepTools/SRR12490774.bw"

# Define the path to the bed file
BED="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/macs2/peaks_final.bed"

# Define the path to the output
OUTPUT="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/visualization/matrix.gz"

# Run the command
computeMatrix \
reference-point --referencePoint center \
-b 4000 -a 4000 \
-R $BED \
-S $CASE_BW $CTRL_BW \
--skipZeros \
-o $OUTPUT \
-p 8

# Create the profile plot
PLOT_OUT="/home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/visualization/encode.png"
plotProfile \
-m /home/mali/NewDrive/Practice/ChIPAndRNA/chipseq/results/visualization/matrix.gz \
-out $PLOT_OUT \
--regionsLabel "" \
--perGroup \
--colors red blue \
--samplesLabel "SRR12490774" "SRR12490775" \
--refPointLabel "DOT1L binding sites"
