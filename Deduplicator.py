## Deduplicator
## Uses regex to find unique random barcode at the beginning of reads, and
## removes the hit with the lowest phred score

def main():

    infile = open('/Users/jcoravos/SRR150XX Project/SRR1509029_withCTGA.fastq', 'rt')
    outfile = open('/Users/jcoravos/SRR150XX Project/SRR1509029_dedupped_withCTGA.fastq', 'wt')

    import re
    linecounter = 0

    for line in infile:
        print(linecounter)
        bc_regex = ('').join(['^', next(BarcodeGen(infile))])
        for line in infile:
            linecounter = linecounter++1
            match = re.match(bc_regex,line)
            if match != None:
                print(match.group())
                print(line)
                print(linecounter)
                ReadNameLine = LinePicker(infile,linecounter)
                s = ([ReadNameLine.rstrip(), 'duplicate barcode',str(match.group()),'\n'])
                print(s)
                New_RNL = (' ').join(s)
                print(New_RNL)
            linecounter = linecounter+1

def BarcodeGen(infile):
    for line in infile:
        pre_bc = next(BarcodeFind(infile))
        barcode = pre_bc.group()
        yield barcode



def BarcodeFind(infile):
    import re
    for line in infile:
        result = re.match('^.....CTGA',line)
        if result == None: continue
        else: yield result

def LinePicker(infile, start):
    for i, line in enumerate(infile):
        if i == start:
            return line
        


if __name__ == "__main__":main()

