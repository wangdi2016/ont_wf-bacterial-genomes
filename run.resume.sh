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
