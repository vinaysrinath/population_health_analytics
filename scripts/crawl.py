import urllib2
import bs4
from bs4 import BeautifulSoup
# import wget
import os, errno
import subprocess

def mkdir_p(path):
    try:
        os.makedirs(path)
    except OSError as exc: # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else: raise


begin_years = [
    2015,
    2013,
    2011,
    2009,
    2007,
    2005,
    2003,
    2001,
    1999
]

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

        headers = map(
            lambda x: x.text,
            soup.find(
                "table", {"id": "PageContents_GridView1"}
                  ).find("thead").findAll("th"))

        data = []
        for r in soup.find("table", {"id": "PageContents_GridView1"}).find("tbody").findAll("tr"):
            tds = r.findAll("td")
            first = r.find("th").text

            link1 = tds[0].find("a")
            second = {
                    "href": link1["href"] if link1 else "",
                    "label": link1.text if link1 else "",
                }

            link2 = tds[1].find("a")
            third = {
                    "href": link2["href"] if link2 else "",
                    "label": link2.text if link2 else "",
                 }

            e = [first, second, third]
            data.append(e)

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
            elif label == "":
                print "Skip empty entry"
                continue
            else:
                file_name = label

            output_file = os.path.join(download_path, file_name)
            print "Downloading: %s from %s"%(label, file_url)
            print "   to the folder: %s"%(output_file)
            cmd = ["wget", "-c", "-O", output_file, file_url]
            subprocess.call(cmd)

            # wget.download(file_url, out=output_file)
            print
            print

        os.chdir(original_path)

