## Download all the NHANES data

### Requirements


You would need Python, R and Shell scripts to perform this data conversion.

For Python, following dependencies are required to be installed: `BeautifulSoup`, `beautifulsoup4`, `wget`

These can be installed easily using pip.

    virtualenv env
    sudo pip install BeautifulSoup beautifulsoup4 wget
    env/bin/activate


### Download

Now execute the crawl/download script:

    python crawl.py


All the data will be downloaded to `downloads` folder. Once that is complet


### Convert to CSV

A simple Shell script does all the files conversion for us. Just go the the dowloads folder and execute the following script:

    sh convert-all.sh

All the XPT files will be converted CSV files, and now we are good to explore all these files using any tools of choice.


### Merge all CSV file

We use a Python script `mongoimport.py` to insert all the CSV, while merging the non-existing fileds into a Mongo collection.

    cd downloads/
    find . -name "*.csv" -exec python ../mongoimport.py "{}" \; | tee mongo-import.log
	

Once all CSV files are imported into MongoDB, we can extract it out as a CSV file.


    mongoexport --db nhanes --collection master --csv --out nhanes-master.csv


