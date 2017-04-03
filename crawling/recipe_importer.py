#!/usr/bin/env python

import crawling
import urllib
import psycopg2
import sys

# subcats contains tuples with the first element being the character, the second
# being the number of pages within the HTML page
subcats = (("123", 2), ("a", 15), ("b", 44), ("c", 73), ("d", 9), ("e", 8),
    ("f", 19), ("g", 33), ("h", 16), ("i", 6), ("j", 5), ("k", 5), ("l", 14),
    ("m", 28), ("n", 5), ("o", 9), ("p", 41), ("q", 3), ("r", 25), ("s", 67),
    ("t", 25), ("u", 2), ("v", 7), ("w", 11), ("xyz", 4))

def url_crawler():
    istring = "http://www.foodnetwork.com/recipes/a-z/"

    con_string = "host='%s' dbname='%s' user='%s' password='%s'" % (sys.argv[1],
            sys.argv[2], sys.argv[3], sys.argv[4])

    print "Connecting to database -> %s ..." % (con_string)

    try:
        # Connect to the database with the given connection string above
        con = psycopg2.connect(con_string)
    except:
        print "Connection error; is the DB connection string correct?"
    else:
        # # con.cursor returns a cursor object you can perform queries with
        # cur = con.cursor()
        print "Connected!\n"

        for s in subcats:
            initchar = s[0]
            numpage = s[1]

            for i in range(1,numpage+1):
                tlink = (istring + initchar + "/p/" + str(i))
                print ("Category %s, Page %d\n" % (initchar.upper(), i))
                crawling.link_spider(tlink, con)

        # Close connection at end
        con.close()

if __name__=="__main__":
    if len(sys.argv) == 5:
        url_crawler()
    else:
        print "Usage:",sys.argv[0],"<host> <dbname> <user> <password>"
