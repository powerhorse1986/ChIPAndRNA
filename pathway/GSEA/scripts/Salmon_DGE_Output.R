library(tximport)
library(DESeq2)
library(apeglm)
library(biomaRt)
library(tidyverse)

# p-value threshold
pvalueThreshold <- 0.05

# BH adjusted p-value threshold
alpha <- 0.05

# log fold change threshold
lfcThreshold <- 0

# sample design file name
design_file_name <- "/home/mali/NewDrive/Practice/ChIPAndRNA/rnaseq/results/STAR/counts/samples.txt"

# define species being used
species <- "Homo Sapiens"
#species <- "Mus Musculus"
#species <- "Danio Rerio"

# get current working directory
dir <- "/home/mali/NewDrive/Practice/ChIPAndRNA/rnaseq/results/salmon"
# list files in cwd
list.files(dir)

# define list of conditions to use
list_conditions <- c("Group_RAS", "Group_CT")
# define reference condition
reference_condition <- "Group_CT"
# define coefficient string
coeff_string <- "condition_Group_RAS_vs_Group_CT"

# read in sample design file and conditions for this
# analysis
samples <- read.table(file.path(design_file_name), header = TRUE)
samples <- samples[samples$condition %in% list_conditions,]
samples

# create list of files to be imported
files <- file.path(dir, samples$mpps_id, "quant.sf")
names(files) <- samples$shortname

# Since there this no EnsDb for Danio Rerio, we are going to building the txi 
# from scratch using biomaRt (By Li Ma 05/18/2023)
####################Start##############################

tx2gene <- getBM(
  attributes = c("ensembl_transcript_id", "ensembl_gene_id"),
  #filters = "ensembl_gene_id",
  mart = mart)
#anns <- anns[match(nm, anns[, 1]), ]
colnames(tx2gene) <- c("tx_id", "gene_id")

txi <- tximport(files, type = "salmon", tx2gene = tx2gene, ignoreTxVersion = TRUE)

# create DESeqDataSet object from tximport object, 
# phenotype data, and the experimental design formulm
# (in this case we want to perform DE on "condition")
dds <- DESeqDataSetFromTximport(txi,
                                colData = samples,
                                design = ~ condition)


# assign the reference condition, i.e.,
# the one that goes in the denominator
dds$condition <- relevel(dds$condition, ref = reference_condition)

# output number of imported rows
nrow(dds)

# run DESeq
dds <- DESeq(dds)

# get the size facotr for normalizing the data
dds <- estimateSizeFactors(dds)

# Extract normalized counts
norm_counts <- counts(dds, normalized = TRUE)
write.table(norm_counts, file="salmon_norm_counts.txt", append = TRUE, sep="\t", row.names = TRUE, col.names = TRUE, quote = FALSE)