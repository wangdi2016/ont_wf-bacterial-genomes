

# Compute requirements

Recommended requirements:

CPUs = 16
Memory = 64GB

Minimum requirements:

CPUs = 8
Memory = 32GB

Approximate run time: 20-40 minutes per sample with ~50x coverage using minimum requirements

ARM processor support: False

# Download a demo dataset
A demo dataset is provided for testing of the workflow. It can be downloaded and unpacked using the following commands:

```
wget https://ont-exd-int-s3-euwst1-epi2me-labs.s3.amazonaws.com/wf-bacterial-genomes/wf-bacterial-genomes-demo.tar.gz

tar -xzvf wf-bacterial-genomes-demo.tar.gz
```

# Download an annotation dataset

wget https://zenodo.org/record/14916843/files/db.tar.xz
tar Jxvf db.tar.xz

db folder is about 83 Gb

# Request an interactive node filfull the requirement

```
sinteractive --mem=64g -c16
```

# Install and run

## 0. Pull pipeline

```
module load nextflow

nextflow pull epi2me-labs/wf-bacterial-genomes
```

## 1. Initial run

```
module load nextflow

export NXF_SINGULARITY_CACHEDIR="/vf/users/wangdi/CGRProjects/ont/EBV/work/singularity"
export SINGULARITY_CACHEDIR="/vf/users/wangdi/CGRProjects/ont/EBV/work/singularity"

export MPLBACKEND="Agg"
export MPLCONFIGDIR="/vf/users/wangdi/CGRProjects/ont/EBV/work/tmp/mplconfig/"
export XDG_CACHE_HOME="/vf/users/wangdi/CGRProjects/ont/EBV/work/tmp/xdg-cache/"

mkdir -p "${MPLCONFIGDIR}"
mkdir -p "${XDG_CACHE_HOME}"

nextflow run epi2me-labs/wf-bacterial-genomes \
        --fastq 'wf-bacterial-genomes-demo/isolates_fastq' \
        --isolates \
        --sample_sheet 'wf-bacterial-genomes-demo/isolates_sample_sheet.csv' \
        --run_bakta false \
        --bakta_db '/data/wangdi/CGRProjects/ont/EBV/db' \
        -profile singularity
```

## 2. Make correction of versions.txt file

Find the versions/versions.txt file in work folder. Then make the following change and re-run.

```
mkdir,-p failed for path /home/wangdi/.config/matplotlib: [Errno 30] Read-only file system: '/home/wangdi'
Matplotlib,created a temporary cache directory at /tmp/matplotlib-sb3mxlij because there was an issue with the default path (/home/wangdi/.config/matplotlib); it is highly recommended to set the MPLCONFIGDIR environment variable to a writable directory, in particular to speed up the import of Matplotlib and to better support multiprocessing.
bakta,1.11.4
medaka,2.2.0
bcftools,1.21
mlst,2.23.0
sourmash,4.9.4
mob_recon,3.1.9
resfinder,4.7.2
SeqSero2,1.2.1
pysam,0.23.3
fastcat,0.22.1
bamstats,0.22.1
mosdepth,0.3.11
flye,2.9.5-b1801
dnaapler,1.2.0
pomoxis,0.3.16
```

to

```
bakta,1.11.4
medaka,2.2.0
bcftools,1.21
mlst,2.23.0
sourmash,4.9.4
mob_recon,3.1.9
resfinder,4.7.2
SeqSero2,1.2.1
pysam,0.23.3
fastcat,0.22.1
bamstats,0.22.1
mosdepth,0.3.11
flye,2.9.5-b1801
dnaapler,1.2.0
pomoxis,0.3.16
```

## 3. Re-run with corrected versions.txt file using the following script.

```
module load nextflow

export NXF_SINGULARITY_CACHEDIR="/vf/users/wangdi/CGRProjects/ont/EBV/work/singularity"
export SINGULARITY_CACHEDIR="/vf/users/wangdi/CGRProjects/ont/EBV/work/singularity"

export MPLBACKEND="Agg"
export MPLCONFIGDIR="/vf/users/wangdi/CGRProjects/ont/EBV/work/tmp/mplconfig/"
export XDG_CACHE_HOME="/vf/users/wangdi/CGRProjects/ont/EBV/work/tmp/xdg-cache/"

mkdir -p "${MPLCONFIGDIR}"
mkdir -p "${XDG_CACHE_HOME}"

nextflow run epi2me-labs/wf-bacterial-genomes \
        --fastq 'wf-bacterial-genomes-demo/isolates_fastq' \
        --isolates \
        --sample_sheet 'wf-bacterial-genomes-demo/isolates_sample_sheet.csv' \
        --run_bakta false \
        --bakta_db '/data/wangdi/CGRProjects/ont/EBV/db' \
        -profile singularity -resume
```

