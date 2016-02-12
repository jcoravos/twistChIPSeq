#!/bin/sh

#  Samtools_HZ.sh
#  
#
#  Created by Jonathan Coravos on 10/15/15.
#

#samtools view -b SRR1509030_aln.sam > SRR1509030_aln.bam
#samtools view -b SRR1509029_aln.sam > SRR1509029_aln.bam

#samtools sort -O bam -o SRR1509030_sorted.bam -T ~/SRRindexing/SRR1509030_sorted -@ 4 SRR1509030_aln.bam
#samtools sort -O bam -o SRR1509029_sorted.bam -T ~/SRRindexing/SRR1509029_sorted -@ 4 SRR1509029_aln.bam


#samtools index -b SRR1509029_sorted.bam
#samtools index -b SRR1509030_sorted.bam

#samtools view -F 0x10 -o SRR15090merged_sorted_forward.sam SRR15090merged_sorted.bam
#samtools view -f 0x10 -o SRR15090merged_sorted_reverse.sam SRR15090merged_sorted.bam

samtools view -o SRR15090merged_sorted_1base.bam SRR15090merged_sorted_1base.sam
samtools index -b SRR15090merged_sorted_1base.bam
