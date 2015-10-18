
import xport
import sys


"""
These command runs for all the files in downloads directory:

find downloads -name "*.XPT" -exec python all-fields.py "{}" \; | sort | tee fields-mapping.txt

grep -v ' File: ' fields-mapping.txt | uniq  > all-fields-mapping.txt

"""



if len(sys.argv) >= 2:
    fname = sys.argv[1] 
    print " File: %s"%(fname)
    reader = xport.XportReader(fname)
    for f in reader.fields:
        print "%s => %s"%(
            f['name'],
            f['label']
        )
else:
    print "No filename given"
