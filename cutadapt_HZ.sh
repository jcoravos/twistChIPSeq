#!/bin/sh

#  cutadapt_HZ.sh
#  
#
#  Created by Jonathan Coravos on 10/14/15.
#

cutadapt -g N{5}CTGA -a AGATCGGAAGAGCACACGTCTGGATCCACGACGCTCTTCCGATCT -o SRR1509029_trimmed.fastq.gz -m 22 SRR1509029_withCTGA.fastq
cutadapt -g N{5}CTGA -a AGATCGGAAGAGCACACGTCTGGATCCACGACGCTCTTCCGATCT -o SRR1509030_trimmed.fastq.gz -m 22 SRR1509030_withCTGA.fastq