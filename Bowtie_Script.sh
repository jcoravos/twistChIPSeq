#!/bin/sh

#  Bowtie_Script.sh
#  
#
#  Created by Jonathan Coravos on 10/15/15.
#
gunzip SRR1509030_trimmed.fastq.gz
gunzip SRR1509029_trimmed.fastq.gz


bowtie -n 2 -m 1 -S -p 4 ~/Applications/bowtie-1.1.2/indexes/d_melanogaster_fb5_48 ~/SRR1509030_trimmed.fastq > SRR1509030_aln.sam

bowtie -n 2 -m 1 -S -p 4 ~/Applications/bowtie-1.1.2/indexes/d_melanogaster_fb5_48 ~/SRR1509029_trimmed.fastq > SRR1509029_aln.sam

