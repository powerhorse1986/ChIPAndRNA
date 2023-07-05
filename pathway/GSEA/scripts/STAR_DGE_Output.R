library(tximport)
library(DESeq2)
library(biomaRt)
library(apeglm)
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
dir <- "/home/mali/NewDrive/Practice/ChIPAndRNA/rnaseq/results/STAR/counts"
# list files in cwd
list.files(dir)

mart <- biomaRt::useMart(biomart = "ensembl",
                         dataset = "hsapiens_gene_ensembl",
                         host = "https://grch37.ensembl.org")

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
#files <- file.path(dir, paste0(samples$mpps_id, ".count"))
files <- paste0(samples$mpps_id, ".count")
samples["fileName"] <- files
samples$mpps_id <- samples$shortname

# Generate a sampleTable for importing HTSeqCount data
#sampleTable <- samples[, c("mpps_id", "fileName", "condition")] %>%
#  dplyr::rename(sampleName = mpps_id)
samples <- samples %>%
  dplyr::rename(sampleName = mpps_id) %>%
  dplyr::relocate(fileName, .after = sampleName) %>%
  dplyr::relocate(condition, .after = fileName)

# Convert condition into factors
samples$condition <- factor(samples$condition)

# Read in counts using DESeqDataSetFromHTSeqCount
dds <- DESeqDataSetFromHTSeqCount(sampleTable = samples,
                                  directory = dir,
                                  design = ~condition)


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
write.table(norm_counts, file="norm_counts.txt", append = TRUE, sep="\t", row.names = TRUE, col.names = TRUE, quote = FALSE)
