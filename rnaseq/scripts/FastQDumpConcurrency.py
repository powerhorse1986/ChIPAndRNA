#! /usr/bin/python

"""A script for downloading fastq files concurrently.

This script aims to download fastq files concurrently. The SRA accession numbers are stored in different
csv files. The names of the csv files are the BioExperiment IDs.
"""
import os
from multiprocessing import Pool

# Path to the directory in which the fastq files are going to be stored
DATA_PATH = "/home/mali/NewDrive/Practice/ChIPAndRNA/rnaseq/raw_data"

def read_csv(csv_path):
    """Reads in a csv file.

    Parameters
    ----------
    csv_path : str
        A str refers to a path to the csv file.

    Returns
    -------
    List
        A list contains the SRA accession numbers
    """
    with open(csv_path, "r") as file:
        tmp_list = file.read().replace("\n", "").split(",")
    return tmp_list

def read_txt(txt_path):
    """Reads in a txt file.

    Parameters
    ----------
    txt_path : str
        A str refers to a path to the target txt file.

    Returns
    -------
    List
        A list contains the SRA accession numbers
    """
    with open(txt_path, "r") as file:
        tmp_list = file.read().strip().split("\n")
    return tmp_list

def dump_fastq(sra_number):
    """The function prefetches and dumps a sra file with the given sra_number

    Parameters
    ----------
    sra_number : str
        A string refers to a SRA accession number.
    """
    prefetch_cmd = f"prefetch {sra_number} -O {DATA_PATH}"
    os.system(prefetch_cmd)
    os.system(f"echo {sra_number} prefetched")

    sra_path = os.path.join(DATA_PATH, sra_number)
    fasterq_dump_cmd = f"fasterq-dump {sra_path} -O {sra_path}"
    os.system(fasterq_dump_cmd)
    os.system(f"echo {sra_number} dumped")

    fastq_path = os.path.join(sra_path, "*.fastq")
    os.system(f"echo gzip {fastq_path}")
    gzip_cmd = f"gzip {fastq_path}"
    os.system(gzip_cmd)

    # Remove the SRA file
    SRA_path = os.path.join(sra_path, f"{sra_number}.sra")
    SRA_remove_cmd = f"rm {SRA_path}"
    os.system(SRA_remove_cmd)

sra_list = read_txt("sra_files.txt")
print(f"{len(sra_list)} files need to be dumped")

with Pool(3) as pool:
    pool.map(dump_fastq, sra_list)
