##Deduplicator2

##This is a script for finding duplicate reads in a sorted .sam file. It functions
##by iterating through chromosomal position, returning all reads that map to that
##position, and checking to see whether any of those reads share identical random
##barcodes. These barcodes are stored in the untrimmed .fastq files, and are
##accessed by looking up the read identifier.
## copyright Jonathan Coravos 11/5/2015


def main():

##    with open('/Users/jcoravos/SRR150XX Project/SRR15090XX Sequence Files/SRR1509029_sorted.sam','r') as fin:
##        L = next(linegen(fin)) # generates the next line in the document
##        p_1 = L[3]
##        while L[1] in ('0','16'): # makes sure we are just looking at standard and strand genome mapping (not mito, etc.)
##            p_2 = p_1
##            Lold = L
##            L = next(linegen(fin))
##            p_1 = L[3]
##            #print(p_1,p_2)
##            if p_1 == p_2: #recursive test to determine whether the subsequent read is at the same position
##                with open('/Users/jcoravos/SRR150XX Project/SRR15090XX Sequence Files/dupSRR1509029.txt','a') as fout:
##                    fout.write(('').join([Lold[0],' '])) #writes the name of this read to a file
##                    while L[3] == Lold[3]:
##                        Lold = L
##                        p_2 = p_1
##                        L = next(linegen(fin))
##                        p_1 = L[3]
##                        fout.write(('').join([Lold[0],' '])) #continues to write this read to a file until the next line is no longer mapped to the same position
##                    fout.write('\n')


## Now take duplicate mapping position data and use it to check for identifal barcodes
        



def linegen(f):
    for i in f:
            L = i.split()
            yield L
            
    
        

if __name__ == "__main__":main()
