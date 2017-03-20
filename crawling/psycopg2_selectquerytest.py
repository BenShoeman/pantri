#!/usr/bin/env python
import psycopg2
import sys

def main():
    con_string = "host='%s' dbname='%s' user='%s' password='%s'" % (sys.argv[1],
            sys.argv[2], sys.argv[3], sys.argv[4])

    # Print the connection string we will use to connect
    print "Connecting to database\n ->%s" % (con_string)

    try:
        # Connect to the database
        con = psycopg2.connect(con_string)
    except:
        print "Connection error."
    else:
        # con.cursor will return a cursor object which can be used to perform queries
        cur = con.cursor()
        print "Connected!\n"
        
        # ----- Test code for running queries -----
        # Run select query on ingredients, selecting their names
        cur.execute("select name from ingredients;")

        # Print all ingredients
        print "Printing all ingredients in the database:"
        for entry in cur:
            print entry[0]
        
        # Close connection at end
        con.close()

if len(sys.argv) == 5:
    main()
else:
    print "Usage:",sys.argv[0],"<host> <dbname> <user> <password>"
