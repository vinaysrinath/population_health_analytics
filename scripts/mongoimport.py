import csv
import pymongo
import sys

db_name = "nhanes"
coll_name = "master"

connection = pymongo.Connection()
collection = connection[db_name][coll_name]

fname = sys.argv[1]
print "import file: %s into %s/%s"%(fname, db_name, coll_name)
reader = csv.DictReader(open(fname))

index = 0
for line in reader:
    index += 1
    print index,
    print "\r",

    if "SEQN" in line.keys():
        seqn = line['SEQN']
        doc = collection.find_one({"SEQN": seqn})
        if doc is None: # insert
            collection.insert(line)
            pass
        else: # update
            collection.update({'SEQN': seqn}, {'$set': line})
            pass
    
    else: # skip
        pass

