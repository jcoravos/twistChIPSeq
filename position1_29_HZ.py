#!/usr/local/bin/python3
#position1_HZ.py by Jonathan Coravos
#This is a script for selecting the first base in .sam files, retaining the
# coordinate position, and writing the modified .sam file to a new file.


def main():
    infile = open('/Users/jcoravos/SRR1509029_sorted_rmdup.sam','rt')
    outfile = open('/Users/jcoravos/SRR1509029_sorted_rmdup_1base.sam','wt')

#    infile = open('/Users/jcoravos/head30test.sam','rt')
#    outfile = open('/Users/jcoravos/head30test_1base.sam','wt')
    for line in infile:
        if line[0] == '@':
            #print('skipped header')
            outfile.write(line)
            continue
        else:
            #print('kept line')
            s = line.split()
            baseid = s[9]
            qualid = s[10]
            sep = '\s'
            str1 = ('\t').join(s[0:5])
            str2 = '1M'
            str3 = ('\t').join(s[6:9])
            str4 = baseid[0]
            str5 = qualid[0]
            str6 = ('\t').join(s[11:22])
            outlist = [str1, str2, str3, str4, str5, str6, '\n']
            outline = ('\t').join(outlist)
            outfile.write(outline)
            #print(outline)
        

    

if __name__ == "__main__":main()
