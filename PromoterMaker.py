## This script creates a BEDfile of all the possible -100:0 promoters in the Dm6 BDGP genome
## First TSS are pulled from a refFLAT annotation file.
## Then the -100 position is identified based on strand orientation.
## Finally, a .bed formatted file is output.


def main():
    fh = open('/Users/jcoravos/Applications/bowtie-1.1.2/genomes/Drosophila_melanogaster_Ensembl_BDGP6/Drosophila_melanogaster/Ensembl/BDGP6/Annotation/Archives/archive-2015-07-23-16-41-33/Genes/refFlat.txt','rt')
    outfh = open('/Users/jcoravos/Desktop/Dm6_100_promoter.bed','wt')

    for line in fh:
        P = PromoterMaker(line)
        if P[0] < 0 | P[1] < 0:
            continue
        O = BedMaker(P,line)
        #print(O)
        outfh.write(O)
    

def PromoterMaker(l):
    fhlist = l.split('\t')
    if fhlist[3] == '+':
        TSS = int(fhlist[4])
        Promoter = [TSS-100,TSS]
        return Promoter
    elif fhlist[3] == '-':
        TSS = int(fhlist[5])
        Promoter = [TSS,TSS+100]
        return Promoter

def BedMaker(P,l):
    fhlist = l.split('\t')
    str1 = fhlist[2]
    str2 = str(P[0])
    str3 = str(P[1])
    str4 = fhlist[0]
    strscore = 'score'
    str5 = fhlist[3]
    str6 = str('\n')
    outlist = [str1,str2,str3,str4,strscore,str5,str6]
    outline = ('\t').join(outlist)
    return outline

if __name__ == "__main__":main()
