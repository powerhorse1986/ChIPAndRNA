<head>ChIPAndRNA</head>

This project aims to repeat the ChIP-Seq and RNA-Seq analyses using data GSE156591, for ChIP-Seq, and GSE156654, for RNA-Seq.

For both two analyses, the following reference files are used:
1. Reference Genome: GRCh37.87.fa
2. GTF file: Homo_sapiens.GRCh37.87.gtf

Due to the limitation on files, the raw fastq files, .bam files and the reference data files are not uploaded. And because of the IPR, the R scripts are not included.

===============================RNA-Seq Analysis=================================
The structure of the folder rnaseq is shown as the following:
<pre>
.
├── results
│   ├── fastqc
│   │   ├── SRR12492510
│   │   │   ├── SRR12492510_1_fastqc.html
│   │   │   ├── SRR12492510_1_fastqc.zip
│   │   │   ├── SRR12492510_2_fastqc.html
│   │   │   └── SRR12492510_2_fastqc.zip
│   │   ├── SRR12492511
│   │   │   ├── SRR12492511_1_fastqc.html
│   │   │   ├── SRR12492511_1_fastqc.zip
│   │   │   ├── SRR12492511_2_fastqc.html
│   │   │   └── SRR12492511_2_fastqc.zip
│   │   ├── SRR12492512
│   │   │   ├── SRR12492512_1_fastqc.html
│   │   │   ├── SRR12492512_1_fastqc.zip
│   │   │   ├── SRR12492512_2_fastqc.html
│   │   │   └── SRR12492512_2_fastqc.zip
│   │   ├── SRR12492513
│   │   │   ├── SRR12492513_1_fastqc.html
│   │   │   ├── SRR12492513_1_fastqc.zip
│   │   │   ├── SRR12492513_2_fastqc.html
│   │   │   └── SRR12492513_2_fastqc.zip
│   │   ├── SRR12492514
│   │   │   ├── SRR12492514_1_fastqc.html
│   │   │   ├── SRR12492514_1_fastqc.zip
│   │   │   ├── SRR12492514_2_fastqc.html
│   │   │   └── SRR12492514_2_fastqc.zip
│   │   ├── SRR12492515
│   │   │   ├── SRR12492515_1_fastqc.html
│   │   │   ├── SRR12492515_1_fastqc.zip
│   │   │   ├── SRR12492515_2_fastqc.html
│   │   │   └── SRR12492515_2_fastqc.zip
│   │   ├── SRR12492516
│   │   │   ├── SRR12492516_1_fastqc.html
│   │   │   ├── SRR12492516_1_fastqc.zip
│   │   │   ├── SRR12492516_2_fastqc.html
│   │   │   └── SRR12492516_2_fastqc.zip
│   │   ├── SRR12492517
│   │   │   ├── SRR12492517_1_fastqc.html
│   │   │   ├── SRR12492517_1_fastqc.zip
│   │   │   ├── SRR12492517_2_fastqc.html
│   │   │   └── SRR12492517_2_fastqc.zip
│   │   ├── SRR12492518
│   │   │   ├── SRR12492518_1_fastqc.html
│   │   │   ├── SRR12492518_1_fastqc.zip
│   │   │   ├── SRR12492518_2_fastqc.html
│   │   │   └── SRR12492518_2_fastqc.zip
│   │   ├── SRR12492519
│   │   │   ├── SRR12492519_1_fastqc.html
│   │   │   ├── SRR12492519_1_fastqc.zip
│   │   │   ├── SRR12492519_2_fastqc.html
│   │   │   └── SRR12492519_2_fastqc.zip
│   │   ├── SRR12492520
│   │   │   ├── SRR12492520_1_fastqc.html
│   │   │   ├── SRR12492520_1_fastqc.zip
│   │   │   ├── SRR12492520_2_fastqc.html
│   │   │   └── SRR12492520_2_fastqc.zip
│   │   └── SRR12492521
│   │       ├── SRR12492521_1_fastqc.html
│   │       ├── SRR12492521_1_fastqc.zip
│   │       ├── SRR12492521_2_fastqc.html
│   │       └── SRR12492521_2_fastqc.zip
│   ├── reports
│   │   ├── salmon_DGE
│   │   │   ├── condition_Group_KD_vs_Group_CT_0.05.xlsx
│   │   │   ├── condition_Group_OE_vs_Group_CT_0.05.xlsx
│   │   │   ├── condition_Group_RAS_vs_Group_CT_0.05.xlsx
│   │   │   ├── GroupKD_Vs_GroupCT_RNA-seq_Salmon_DGE_simple.html
│   │   │   ├── GroupOE_Vs_GroupCT_RNA-seq_Salmon_DGE_simple.html
│   │   │   └── GroupRAS_Vs_GroupCT_RNA-seq_Salmon_DGE_simple.html
│   │   ├── salmon_EDA
│   │   │   └── RNA-seq_Salmon_EDA_simple.html
│   │   ├── STAR_DGE
│   │   │   ├── condition_Group_KD_vs_Group_CT_0.05.xlsx
│   │   │   ├── condition_Group_OE_vs_Group_CT_0.05.xlsx
│   │   │   ├── condition_Group_RAS_vs_Group_CT_0.05.xlsx
│   │   │   ├── GroupKD_Vs_GroupCT_RNA-seq_STAR_DGE_simple.html
│   │   │   ├── GroupOE_Vs_GroupCT_RNA-seq_STAR_DGE_simple.html
│   │   │   └── GroupRAS_Vs_GroupCT_RNA-seq_STAR_DGE_simple.html
│   │   └── STAR_EDA
│   │       └── RNA-seq_STAR_EDA_simple.html
│   ├── salmon
│   │   ├── samples.txt
│   │   ├── SRR12492510
│   │   │   ├── aux_info
│   │   │   │   ├── ambig_info.tsv
│   │   │   │   ├── expected_bias.gz
│   │   │   │   ├── fld.gz
│   │   │   │   ├── meta_info.json
│   │   │   │   ├── observed_bias_3p.gz
│   │   │   │   └── observed_bias.gz
│   │   │   ├── cmd_info.json
│   │   │   ├── lib_format_counts.json
│   │   │   ├── libParams
│   │   │   │   └── flenDist.txt
│   │   │   ├── logs
│   │   │   │   └── salmon_quant.log
│   │   │   └── quant.sf
│   │   ├── SRR12492511
│   │   │   ├── aux_info
│   │   │   │   ├── ambig_info.tsv
│   │   │   │   ├── expected_bias.gz
│   │   │   │   ├── fld.gz
│   │   │   │   ├── meta_info.json
│   │   │   │   ├── observed_bias_3p.gz
│   │   │   │   └── observed_bias.gz
│   │   │   ├── cmd_info.json
│   │   │   ├── lib_format_counts.json
│   │   │   ├── libParams
│   │   │   │   └── flenDist.txt
│   │   │   ├── logs
│   │   │   │   └── salmon_quant.log
│   │   │   └── quant.sf
│   │   ├── SRR12492512
│   │   │   ├── aux_info
│   │   │   │   ├── ambig_info.tsv
│   │   │   │   ├── expected_bias.gz
│   │   │   │   ├── fld.gz
│   │   │   │   ├── meta_info.json
│   │   │   │   ├── observed_bias_3p.gz
│   │   │   │   └── observed_bias.gz
│   │   │   ├── cmd_info.json
│   │   │   ├── lib_format_counts.json
│   │   │   ├── libParams
│   │   │   │   └── flenDist.txt
│   │   │   ├── logs
│   │   │   │   └── salmon_quant.log
│   │   │   └── quant.sf
│   │   ├── SRR12492513
│   │   │   ├── aux_info
│   │   │   │   ├── ambig_info.tsv
│   │   │   │   ├── expected_bias.gz
│   │   │   │   ├── fld.gz
│   │   │   │   ├── meta_info.json
│   │   │   │   ├── observed_bias_3p.gz
│   │   │   │   └── observed_bias.gz
│   │   │   ├── cmd_info.json
│   │   │   ├── lib_format_counts.json
│   │   │   ├── libParams
│   │   │   │   └── flenDist.txt
│   │   │   ├── logs
│   │   │   │   └── salmon_quant.log
│   │   │   └── quant.sf
│   │   ├── SRR12492514
│   │   │   ├── aux_info
│   │   │   │   ├── ambig_info.tsv
│   │   │   │   ├── expected_bias.gz
│   │   │   │   ├── fld.gz
│   │   │   │   ├── meta_info.json
│   │   │   │   ├── observed_bias_3p.gz
│   │   │   │   └── observed_bias.gz
│   │   │   ├── cmd_info.json
│   │   │   ├── lib_format_counts.json
│   │   │   ├── libParams
│   │   │   │   └── flenDist.txt
│   │   │   ├── logs
│   │   │   │   └── salmon_quant.log
│   │   │   └── quant.sf
│   │   ├── SRR12492515
│   │   │   ├── aux_info
│   │   │   │   ├── ambig_info.tsv
│   │   │   │   ├── expected_bias.gz
│   │   │   │   ├── fld.gz
│   │   │   │   ├── meta_info.json
│   │   │   │   ├── observed_bias_3p.gz
│   │   │   │   └── observed_bias.gz
│   │   │   ├── cmd_info.json
│   │   │   ├── lib_format_counts.json
│   │   │   ├── libParams
│   │   │   │   └── flenDist.txt
│   │   │   ├── logs
│   │   │   │   └── salmon_quant.log
│   │   │   └── quant.sf
│   │   ├── SRR12492516
│   │   │   ├── aux_info
│   │   │   │   ├── ambig_info.tsv
│   │   │   │   ├── expected_bias.gz
│   │   │   │   ├── fld.gz
│   │   │   │   ├── meta_info.json
│   │   │   │   ├── observed_bias_3p.gz
│   │   │   │   └── observed_bias.gz
│   │   │   ├── cmd_info.json
│   │   │   ├── lib_format_counts.json
│   │   │   ├── libParams
│   │   │   │   └── flenDist.txt
│   │   │   ├── logs
│   │   │   │   └── salmon_quant.log
│   │   │   └── quant.sf
│   │   ├── SRR12492517
│   │   │   ├── aux_info
│   │   │   │   ├── ambig_info.tsv
│   │   │   │   ├── expected_bias.gz
│   │   │   │   ├── fld.gz
│   │   │   │   ├── meta_info.json
│   │   │   │   ├── observed_bias_3p.gz
│   │   │   │   └── observed_bias.gz
│   │   │   ├── cmd_info.json
│   │   │   ├── lib_format_counts.json
│   │   │   ├── libParams
│   │   │   │   └── flenDist.txt
│   │   │   ├── logs
│   │   │   │   └── salmon_quant.log
│   │   │   └── quant.sf
│   │   ├── SRR12492518
│   │   │   ├── aux_info
│   │   │   │   ├── ambig_info.tsv
│   │   │   │   ├── expected_bias.gz
│   │   │   │   ├── fld.gz
│   │   │   │   ├── meta_info.json
│   │   │   │   ├── observed_bias_3p.gz
│   │   │   │   └── observed_bias.gz
│   │   │   ├── cmd_info.json
│   │   │   ├── lib_format_counts.json
│   │   │   ├── libParams
│   │   │   │   └── flenDist.txt
│   │   │   ├── logs
│   │   │   │   └── salmon_quant.log
│   │   │   └── quant.sf
│   │   ├── SRR12492519
│   │   │   ├── aux_info
│   │   │   │   ├── ambig_info.tsv
│   │   │   │   ├── expected_bias.gz
│   │   │   │   ├── fld.gz
│   │   │   │   ├── meta_info.json
│   │   │   │   ├── observed_bias_3p.gz
│   │   │   │   └── observed_bias.gz
│   │   │   ├── cmd_info.json
│   │   │   ├── lib_format_counts.json
│   │   │   ├── libParams
│   │   │   │   └── flenDist.txt
│   │   │   ├── logs
│   │   │   │   └── salmon_quant.log
│   │   │   └── quant.sf
│   │   ├── SRR12492520
│   │   │   ├── aux_info
│   │   │   │   ├── ambig_info.tsv
│   │   │   │   ├── expected_bias.gz
│   │   │   │   ├── fld.gz
│   │   │   │   ├── meta_info.json
│   │   │   │   ├── observed_bias_3p.gz
│   │   │   │   └── observed_bias.gz
│   │   │   ├── cmd_info.json
│   │   │   ├── lib_format_counts.json
│   │   │   ├── libParams
│   │   │   │   └── flenDist.txt
│   │   │   ├── logs
│   │   │   │   └── salmon_quant.log
│   │   │   └── quant.sf
│   │   └── SRR12492521
│   │       ├── aux_info
│   │       │   ├── ambig_info.tsv
│   │       │   ├── expected_bias.gz
│   │       │   ├── fld.gz
│   │       │   ├── meta_info.json
│   │       │   ├── observed_bias_3p.gz
│   │       │   └── observed_bias.gz
│   │       ├── cmd_info.json
│   │       ├── lib_format_counts.json
│   │       ├── libParams
│   │       │   └── flenDist.txt
│   │       ├── logs
│   │       │   └── salmon_quant.log
│   │       └── quant.sf
│   └── STAR
│       ├── counts
│       │   ├── samples.txt
│       │   ├── SRR12492510.count
│       │   ├── SRR12492511.count
│       │   ├── SRR12492512.count
│       │   ├── SRR12492513.count
│       │   ├── SRR12492514.count
│       │   ├── SRR12492515.count
│       │   ├── SRR12492516.count
│       │   ├── SRR12492517.count
│       │   ├── SRR12492518.count
│       │   ├── SRR12492519.count
│       │   ├── SRR12492520.count
│       │   └── SRR12492521.count
│       ├── SRR12492510
│       │   ├── Log.final.out
│       │   ├── Log.out
│       │   ├── Log.progress.out
│       │   └── SJ.out.tab
│       ├── SRR12492511
│       │   ├── Log.final.out
│       │   ├── Log.out
│       │   ├── Log.progress.out
│       │   └── SJ.out.tab
│       ├── SRR12492512
│       │   ├── Log.final.out
│       │   ├── Log.out
│       │   ├── Log.progress.out
│       │   └── SJ.out.tab
│       ├── SRR12492513
│       │   ├── Log.final.out
│       │   ├── Log.out
│       │   ├── Log.progress.out
│       │   └── SJ.out.tab
│       ├── SRR12492514
│       │   ├── Log.final.out
│       │   ├── Log.out
│       │   ├── Log.progress.out
│       │   └── SJ.out.tab
│       ├── SRR12492515
│       │   ├── Log.final.out
│       │   ├── Log.out
│       │   ├── Log.progress.out
│       │   └── SJ.out.tab
│       ├── SRR12492516
│       │   ├── Log.final.out
│       │   ├── Log.out
│       │   ├── Log.progress.out
│       │   └── SJ.out.tab
│       ├── SRR12492517
│       │   ├── Log.final.out
│       │   ├── Log.out
│       │   ├── Log.progress.out
│       │   └── SJ.out.tab
│       ├── SRR12492518
│       │   ├── Log.final.out
│       │   ├── Log.out
│       │   ├── Log.progress.out
│       │   └── SJ.out.tab
│       ├── SRR12492519
│       │   ├── Log.final.out
│       │   ├── Log.out
│       │   ├── Log.progress.out
│       │   └── SJ.out.tab
│       ├── SRR12492520
│       │   ├── Log.final.out
│       │   ├── Log.out
│       │   ├── Log.progress.out
│       │   └── SJ.out.tab
│       └── SRR12492521
│           ├── Log.final.out
│           ├── Log.out
│           ├── Log.progress.out
│           └── SJ.out.tab
└── scripts
    ├── automation_one.sh
    ├── create_star_index.sh
    ├── FastQDumpConcurrency.py
    ├── generateDecoyTranscriptome.sh
    ├── salom_quant.sh
    └── sra_files.txt
</pre>

For the RNA-Seq analysis, the following software are used:
1. STAR: v2.7.10a
2. htseq-count: v2.0.3
3. salmon: v1.4.0
4. R: v4.3.1
5. tximport_1.28.0
6. DESeq2_1.40.2
7. biomaRt_2.56.1
8. tidyverse_2.0.0
9. gplots_3.1.3
10. DT_0.28
11. reshape_0.8.9
12. RColorBrewer_1.1.3

In the directory rnaseq, there are two sub-directories:
1. results, which contains all the outputs from the pipeline
2. scripts, which includes all the scripts (except the R scripts) used for running the pipeline

Next, a detailed introduction will be give to the direcotry "result":
The directory results have four sub-directories: fastqc, reports, salmon, STAR.
1. In the directory fastqc, there are 12 sub-directories names after the SRR accession numbers. Each sub-directory contains the fastqc results for both two strands.
2. In the reports folder, there are four sub-folders: salmon_EDA, salmon_DGE, STAR_EDA, and STAR_DGE. In the folders salmon_EDA, STAR_EDA, the Exploratory Data Analysis(EDA) reports generated based on gene counts created by salmon and STAR accordingly. The Differential Gene Expression(DGE) analysis outputs generated based on gene counts from salmon and STAR can be found int salmon_DGE, STAR_DGE correspondingly.
3. In the salmon folders, 12 sub-directories named after the SRR accession numbers can be found. In each sub-directory, the gene counts file quant.sf can be found.
4. In the STAR directory, a sub-directory "counts" can be found. The counts folder contains the gene counts files, in .count format, for each sample generated by htseq-count.
====================================End RNA-Seq=================================

=================================ChIP-Seq Analysis==============================
Case sample: SRR12490775
Control Sample: SRR12490774

The following steps were take to process the data
1. Run fastqc on the fastq files
2. Align the fastq files using bowtie
3. Generate the .narrowpeak file using macs2 with SRR12490774 as the control sample and SRR12490775 as the case sample. (The website of the data showed that SRR12490774 is the control sample). And the command for calling macs2 could be found via the path ./chipseq/scripts/peak_calling.sh 
4. Intersect the peaks with the promoter regions(defined as 200 bp around a TSS in this case)

Other than macs2, HOMER was used to analysis the aligned data. The following command was used to identify the significant peaks:
findPeaks <tag directory> -style histone -o auto -i <control tag directory>
The same as macs2, the sample SRR12490774 was set as the control case. And the output of this command, peaks.txt, can be found in the directory chipseq/results/homer. 
bedGraph.gz files for each sample were generated using the command makeUCSCfile from HOMER. And the output can be found via the path ./chipseq/results/homer/UCSCFile/SRR1249077\*/SRR1249077\*.ucsc.bedGraph.gz
Tried to generate the bigWig files using HOMER. However, an error kept popping out. Still trying to get it fiexed. But, deepTools generated the bigWig files sucessfully and the files can be found in the path ./chip/results/visualization/bigwig


The directory tree of chipseq is shown as follow
<pre>
.
├── results
│   ├── fastqc
│   │   ├── SRR12490774
│   │   └── SRR12490775
│   ├── HOMER
│   │   ├── peaks
│   │   │   └── peaks
│   │   └── Tags
│   │       ├── SRR12490774
│   │       │   ├── 10.tags.tsv
│   │       │   ├── 11.tags.tsv
│   │       │   ├── 12.tags.tsv
│   │       │   ├── 13.tags.tsv
│   │       │   ├── 14.tags.tsv
│   │       │   ├── 15.tags.tsv
│   │       │   ├── 16.tags.tsv
│   │       │   ├── 17.tags.tsv
│   │       │   ├── 18.tags.tsv
│   │       │   ├── 19.tags.tsv
│   │       │   ├── 1.tags.tsv
│   │       │   ├── 20.tags.tsv
│   │       │   ├── 21.tags.tsv
│   │       │   ├── 22.tags.tsv
│   │       │   ├── 2.tags.tsv
│   │       │   ├── 3.tags.tsv
│   │       │   ├── 4.tags.tsv
│   │       │   ├── 5.tags.tsv
│   │       │   ├── 6.tags.tsv
│   │       │   ├── 7.tags.tsv
│   │       │   ├── 8.tags.tsv
│   │       │   ├── 9.tags.tsv
│   │       │   ├── MT.tags.tsv
│   │       │   ├── tagAutocorrelation.txt
│   │       │   ├── tagCountDistribution.txt
│   │       │   ├── tagInfo.txt
│   │       │   ├── tagLengthDistribution.txt
│   │       │   ├── X.tags.tsv
│   │       │   └── Y.tags.tsv
│   │       └── SRR12490775
│   │           ├── 10.tags.tsv
│   │           ├── 11.tags.tsv
│   │           ├── 12.tags.tsv
│   │           ├── 13.tags.tsv
│   │           ├── 14.tags.tsv
│   │           ├── 15.tags.tsv
│   │           ├── 16.tags.tsv
│   │           ├── 17.tags.tsv
│   │           ├── 18.tags.tsv
│   │           ├── 19.tags.tsv
│   │           ├── 1.tags.tsv
│   │           ├── 20.tags.tsv
│   │           ├── 21.tags.tsv
│   │           ├── 22.tags.tsv
│   │           ├── 2.tags.tsv
│   │           ├── 3.tags.tsv
│   │           ├── 4.tags.tsv
│   │           ├── 5.tags.tsv
│   │           ├── 6.tags.tsv
│   │           ├── 7.tags.tsv
│   │           ├── 8.tags.tsv
│   │           ├── 9.tags.tsv
│   │           ├── MT.tags.tsv
│   │           ├── tagAutocorrelation.txt
│   │           ├── tagCountDistribution.txt
│   │           ├── tagInfo.txt
│   │           ├── tagLengthDistribution.txt
│   │           ├── X.tags.tsv
│   │           └── Y.tags.tsv
│   ├── macs2
│   │   ├── CaseVsCtrl
│   │   │   ├── compare_peaks_filtered.bed
│   │   │   ├── peaks_model.pdf
│   │   │   ├── peaks_model.r
│   │   │   ├── peaks_peaks.narrowPeak
│   │   │   ├── peaks_peaks.xls
│   │   │   └── peaks_summits.bed
│   │   ├── peaks_final.bed
│   │   ├── SRR12490774
│   │   │   ├── ctrl_peaks_filtered.bed
│   │   │   ├── ctrl_peaks_model.pdf
│   │   │   ├── ctrl_peaks_model.r
│   │   │   ├── ctrl_peaks_peaks.narrowPeak
│   │   │   ├── ctrl_peaks_peaks.xls
│   │   │   └── ctrl_peaks_summits.bed
│   │   └── SRR12490775
│   │       ├── case_peaks_filtered.bed
│   │       ├── case_peaks_model.pdf
│   │       ├── case_peaks_model.r
│   │       ├── case_peaks_peaks.narrowPeak
│   │       ├── case_peaks_peaks.xls
│   │       └── case_peaks_summits.bed
│   └── visualization
│       ├── bigwigs
│       │   └── generatedByDeepTools
│       │       ├── compare.bw
│       │       ├── SRR12490774.bw
│       │       └── SRR12490775.bw
│       ├── encode.png
│       └── matrix.gz
└── scripts
    ├── automation.sh
    ├── chipseq.Rmd
    ├── data_visualization.sh
    ├── handle_peaks.sh
    ├── peak_call.sh
    └── sra_files.txt
</pre>
To perform the analysis, the following software were used:
1. bowtie-1.3.1
2. fastqc-0.12.1
3. macs-2.2.7.1
4. HOMER-4.11
5. deepTools-3.5.1
6. R-4.3.1
7. genomation-1.32.0
8. IRagnes-2.34.1
9. chipseq-1.50.0
10. Gviz-1.44.0
11. biomaRt-2.56.1

