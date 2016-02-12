#!/bin/sh

#  Samtools_sort_index.sh
#  
#
#  Created by Jonathan Coravos on 10/15/15.
#


samtools sort -O bam -o SRR1509030_sorted.bam -T ~/SRRindexing/SRR1509030_sorted -@ 4 SRR1509030_aln.bam
samtools sort -O bam -o SRR1509029_sorted.bam -T ~/SRRindexing/SRR1509029_sorted -@ 4 SRR1509029_aln.bam


samtools index -b SRR1509029_sorted.bam
samtools index -b SRR1509030_sorted.bam