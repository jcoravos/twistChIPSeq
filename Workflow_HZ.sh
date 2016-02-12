#!/bin/sh

#  Workflow_HZ.sh
#  
#
#  Created by Jonathan Coravos on 10/28/15.
#
## Download SRR data using SRAToolkit

#fastq-dump -Z SRR1509030 > SRR1509030.fastq
#fastq-dump -Z SRR1509029 > SRR1509029.fastq
#
#cat SRR1509030.fastq | grep -e '^.....CTGA' -B1 -A2 | awk '$0 != "--"'  > SRR1509030_withCTGA.fastq
#cat SRR1509029.fastq | grep -e '^.....CTGA' -B1 -A2 | awk '$0 != "--"'  > SRR1509029_withCTGA.fastq

## Remove 5' and 3' adaptor sequences
#
#cutadapt -g N{5}CTGA -a AGATCGGAAGAGCACACGTCTGGATCCACGACGCTCTTCCGATCT -o SRR1509029_trimmed.fastq -m 22 SRR1509029_withCTGA.fastq
#cutadapt -g N{5}CTGA -a AGATCGGAAGAGCACACGTCTGGATCCACGACGCTCTTCCGATCT -o SRR1509030_trimmed.fastq -m 22 SRR1509030_withCTGA.fastq
#
#
### aligning to Dm BDGP6 genome using bowtie, tolerating up to 1 mismatch per read and only reporting uniquely aligning reads
#
#   bowtie -n 2 -m 1 -S -p 4 ~/Applications/bowtie-1.1.2/genomes/Drosophila_melanogaster_Ensembl_BDGP6/Drosophila_melanogaster/Ensembl/BDGP6/Sequence/BowtieIndex/genome ~/SRR1509030_trimmed.fastq > SRR1509030_aln.sam
#
#   bowtie -n 2 -m 1 -S -p 4 ~/Applications/bowtie-1.1.2/genomes/Drosophila_melanogaster_Ensembl_BDGP6/Drosophila_melanogaster/Ensembl/BDGP6/Sequence/BowtieIndex/genome ~/SRR1509029_trimmed.fastq > SRR1509029_aln.sam
#
### Sort aligned reads by chromosomal coordinate

#   samtools sort -O sam -o SRR1509030_sorted.sam -T ~/SRRindexing/SRR1509030_sorted -@ 4 SRR1509030_aln.sam
#   samtools sort -O sam -o SRR1509029_sorted.sam -T ~/SRRindexing/SRR1509029_sorted -@ 4 SRR1509029_aln.sam

## Optional commands for making IGV-compatible bam files and indeces before deduplicating and removing excess bases
#samtools view -bS SRR1509029_sorted.sam > SRR1509029_sorted.bam
#samtools view -bS SRR1509030_sorted.sam > SRR1509030_sorted.bam
#samtools index -b SRR1509029_sorted.bam
#samtools index -b SRR1509030_sorted.bam

## Remove duplicates by position and read identity

#   java -Xmx2g -jar ~/Applications/picard-1.140/dist/picard.jar MarkDuplicates  INPUT=SRR1509030_sorted.sam OUTPUT=SRR1509030_sorted_rmdup.sam METRICS_FILE=SRR1509030_dups REMOVE_DUPLICATES=true
#   java -Xmx2g -jar ~/Applications/picard-1.140/dist/picard.jar MarkDuplicates  INPUT=SRR1509029_sorted.sam OUTPUT=SRR1509029_sorted_rmdup.sam METRICS_FILE=SRR1509029_dups REMOVE_DUPLICATES=true

#   python3 ~/Applications/Scripts/position1_29_HZ.py
#   python3 ~/Applications/Scripts/position1_30_HZ.py

#   samtools view -b -S SRR1509029_sorted_rmdup_1base.sam > SRR1509029_sorted_rmdup_1base.bam
#   samtools view -b -S SRR1509030_sorted_rmdup_1base.sam > SRR1509030_sorted_rmdup_1base.bam

#   samtools index -b SRR1509029_sorted_rmdup_1base.bam
#   samtools index -b SRR1509030_sorted_rmdup_1base.bam

## Generating -100 bp promoter sequences
##Download gene annotation refFLAT file for BDGP Dm6 release
##Python scripts to id TSS and take -100 - 0 position

#   python3 ~/Applications/Scripts/PromoterMaker.py
##manually remove the mito and unmmapped reads from the bottom of the file

## Merges multiple overlapping promoters into 1, and joins the gene name strings
#   mergeBed -s -i Dm6_100_promoter.sorted.bed -c 4 -o distinct > Dm6_100_promoter_merged.bed

## Prep Reads and .bed promoters for coverage analysis
bedtools bamtobed -i SRR1509030_sorted.bam > SRR1509030_sorted.bed
bedtools bamtobed -i SRR1509029_sorted.bam > SRR1509029_sorted.bed

#sortBed -i Dm6_100_promoter.bed > Dm6_100_promoter.sorted.bed

##Determine coverage
bedtools coverage -c -a Dm6_100_promoter_merged.bed -b SRR1509030_sorted.bed > coverage_30.bed
bedtools coverage -c -a Dm6_100_promoter_merged.bed -b SRR1509029_sorted.bed > coverage_29.bed