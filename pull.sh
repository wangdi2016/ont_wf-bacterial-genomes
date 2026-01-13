module load nextflow

nextflow pull epi2me-labs/wf-bacterial-genomes

wget https://ont-exd-int-s3-euwst1-epi2me-labs.s3.amazonaws.com/wf-bacterial-genomes/wf-bacterial-genomes-demo.tar.gz
tar -xzvf wf-bacterial-genomes-demo.tar.gz
