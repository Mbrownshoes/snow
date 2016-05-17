

# from pprint import pprint
# import json
import csv

newlist = []
year = {}
data_level = {}

# group dictionary used to encode provincial file
groups = {'Precipitation':'P',
         'Accumulated_Precip':'AccumP',
         'Snow_Water_Equivalent':'SWE',
         'Snow_Depth':'SD'}

# pprint (groups)

# create a file @ for the province by school
# go through entire file to accumulate all the years then write these to a file
with open('build/daily_asp_archive.csv','r') as f:
    reader = csv.reader(f)

    with open('build/daily.csv','w') as w:
        writer = csv.writer(w)
        # writer.writerow(['id','date','var','value','code'])
        # fwD = open('g2g_files/DistG2G2012_2013.txt','w')
        # fwP = open('g2g_files/ProvG2G2012_2013.txt','w')
        for row in reader:
            # newlist[0] = newlist[0][2:5]+newlist[0][7:9]#shrink year 2014/2015 > 14/15
            try:
                row[2] = groups[row[2]] # assign group codes based on group found in
            except:
                print row[2] + ' won\'t be shortend'
            writer.writerow(["_"+row[0],row[1],row[2],row[3],row[4]])

  