import urllib2
import bs4
from bs4 import BeautifulSoup
import wget
import os, errno

def mkdir_p(path):
    try:
        os.makedirs(path)
    except OSError as exc: # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else: raise


begin_years = [2015, 2013, 2011, 2009, 2007, 2005, 2003, 2001, 1999]

components = [
    "Demographics",
    "Dietary",
    "Examination",
    "Laboratory",
    "Questionnaire",
    "Non-Public"
]

original_path = os.getcwd()

for begin_year in begin_years:

    for component in components:


        # url = "http://wwwn.cdc.gov/Nchs/Nhanes/Search/DataPage.aspx?Component=Examination&CycleBeginYear=2009"

        base = "http://wwwn.cdc.gov/Nchs/Nhanes/Search/DataPage.aspx?"
        url = "%sComponent=%s&CycleBeginYear=%s"%(base, component, begin_year)

        print (begin_year, component, url)

        text = urllib2.urlopen(url).read()
        soup = BeautifulSoup(text)
        table = soup.find("table", {"id": "PageContents_GridView1"})

        if table is None:
            print "NO DATA AVAILABLE"
            continue

        thead = table.find("thead")
        tbody = table.find("tbody")
        head_rows = thead.findAll("tr")

        # for tr in head_rows:
        #     for th in tr.findAll("th"):
        #         print th


        # body_rows = tbody.findAll("tr")

        # for tr in body_rows:
        #     for th in tr.findAll("th"):
        #         print th
        #     for a in tr.findAll("a"):
        #         print a

        # for tds in [tr.findAll("td") for tr in ]:
        #     map(lambda x: x.find("a"), tds)


        headers = map(
            lambda x: x.text,
            soup.find(
                "table", {"id": "PageContents_GridView1"}
                  ).find("thead").findAll("th"))

        data = map(
            lambda r: [
                r.find("th").text,
                {
                    "href": r.findAll("td")[0].find("a")["href"],
                    "label": r.findAll("td")[0].find("a").text,
                },
                {
                    "href": r.findAll("td")[1].find("a")["href"],
                    "label": r.findAll("td")[1].find("a").text,
                 }
            ],
            soup.find("table", {"id": "PageContents_GridView1"}).find("tbody").findAll("tr")
        )

        download_path = os.path.join(original_path, "downloads", str(begin_year), component)
        mkdir_p(download_path)

        os.chdir(download_path)
        for datum in data:
            label = datum[2]["label"]
            file_url = datum[2]["href"]
            file_name = "DATA"
            if "XPT" in label:
                file_name = "%s.XPT"%(label.split()[0])
            elif "ZIP" in label:
                file_name = "%s.ZIP"%(label.split()[0])
            else:
                file_name = label

            output_file = os.path.join(download_path, file_name)
            print "Downloading: %s from %s"%(label, file_url)
            print "   to the folder: %s"%(output_file)
            wget.download(file_url, out=output_file)
            print
            print

        os.chdir(original_path)

