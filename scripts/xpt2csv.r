library(foreign)
args <- commandArgs(trailingOnly=TRUE)
fname =  args[1]
out_fname = paste(fname, ".csv", sep="")
print(args)
print(fname)
print(out_fname)

df = read.xport(fname)

write.csv2(df, file=out_fname)
