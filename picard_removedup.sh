#!/bin/sh

#  picard_removedup.sh
#  
#
#  Created by Jonathan Coravos on 10/19/15.
#
java -Xmx2g -jar ~/Applications/picard-1.140/dist/picard.jar MarkDuplicates  INPUT=SRR1509030_sorted.bam OUTPUT=SRR1509030_sorted_rmdup.bam METRICS_FILE=SRR1509030_dups REMOVE_DUPLICATES=true

java -Xmx2g -jar ~/Applications/picard-1.140/dist/picard.jar MarkDuplicates  INPUT=SRR1509029_sorted.bam OUTPUT=SRR1509029_sorted_rmdup.bam METRICS_FILE=SRR1509029_dups REMOVE_DUPLICATES=true
