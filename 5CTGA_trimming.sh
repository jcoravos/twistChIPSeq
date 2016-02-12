#!/bin/bash

cat SRR1509030.fastq | grep -e '^.....CTGA' -B1 -A2 | awk '$0 != "--"'|gzip > SRR1509030_withCTGA.fastq.gz

cat SRR1509029.fastq | grep -e '^.....CTGA' -B1 -A2 | awk '$0 != "--"'|gzip > SRR1509029_withCTGA.fastq.gz