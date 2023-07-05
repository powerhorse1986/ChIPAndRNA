library(DESeq2)
library(biomaRt)
library(tidyverse)
library(pathfindR)
library(apeglm)

# p-value threshold
pvalueThreshold <- 0.05

# BH adjusted p-value threshold
alpha <- 0.05

# log fold change threshold
lfcThreshold <- 0

# set up contrast for generating results
contrast_ad <- c("condition", "Group_CT", "Group_RAS")

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

# Define contrasts, extract results table, and shrink the log2 fold changes
res_tableOE_unshrunken <- results(dds, contrast = contrast_ad, alpha = 0.05)

# Using "ashr" to shrink the result
res <- lfcShrink(dds, contrast = contrast_ad, 
                 res = res_tableOE_unshrunken, type = "ashr")

res$ensembl_gene_id <- rownames(res)

input_df <- data.frame(ensembl_gene_id = res$ensembl_gene_id, lgFC = res$log2FoldChange, FDR_p = res$padj) %>%
  drop_na() %>%
  filter(FDR_p < 0.05)

mart <- biomaRt::useMart(biomart = "ensembl",
                         dataset = "hsapiens_gene_ensembl",
                         host = 'grch37.ensembl.org')

converted <- getBM(attributes = c("ensembl_gene_id", "hgnc_symbol"),
                   filters = "ensembl_gene_id",
                   values = unique(input_df$ensembl_gene_id),
                   mart = mart)

input_df$hgnc_symbol <- converted$hgnc_symbol[match(input_df$ensembl_gene_id, converted$ensembl_gene_id)]

input_df <- input_df[, c("hgnc_symbol", "lgFC", "FDR_p")]

output_df <- run_pathfindR(input_df,
                           output_dir = "/home/mali/NewDrive/Practice/ChIPAndRNA/pathway/pathfindR/outputs/STAR",
                           p_val_threshold = 0.05)
input_processed <- input_processing(input_df,
                                    p_val_threshold = 0.05)
visualize_terms(
  result_df = output_df,
  input_processed = input_processed,
  hsa_KEGG = TRUE
)
