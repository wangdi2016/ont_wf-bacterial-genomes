

# Compute requirements

Recommended requirements:

CPUs = 16
Memory = 64GB
Minimum requirements:

CPUs = 8
Memory = 32GB
Approximate run time: 20-40 minutes per sample with ~50x coverage using minimum requirements

ARM processor support: False


# Install and run

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

# Download a demo dataset
A demo dataset is provided for testing of the workflow. It can be downloaded and unpacked using the following commands:

wget https://ont-exd-int-s3-euwst1-epi2me-labs.s3.amazonaws.com/wf-bacterial-genomes/wf-bacterial-genomes-demo.tar.gz
tar -xzvf wf-bacterial-genomes-demo.tar.gz

# Download an annotation dataset

wget https://zenodo.org/record/14916843/files/db.tar.xz
tar Jxvf db.tar.xz

db folder is about 83 Gb
