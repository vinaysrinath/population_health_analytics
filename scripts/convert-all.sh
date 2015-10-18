
# Convert all XPT files to CSV

## Sample command to convert just one file
## Rscript xpt2csv.r downloads/1999/Demographics/DEMO.XPT

find downloads/ -name "*.XPT" -exec Rscript xpt2csv.r "{}" \;

