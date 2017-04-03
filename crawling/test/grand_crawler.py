import prototype2
import urllib
#grand crawler
#go to the very end of the file, replace the character with another one

def url_generator(initchar):
    istring = 'http://www.foodnetwork.com/recipes/a-z/'
    if initchar == "123":
        numpage = 2
    elif initchar == "a":
        numpage = 15
    elif initchar == "b":
        numpage = 44
    elif initchar == "c":
        numpage = 73
    elif initchar == "d":
        numpage == 9
    elif initchar == "e":
        numpage = 8
    elif initchar == "f":
        numpage = 19
    elif initchar == "g":
        numpage = 33
    elif initchar == "h":
        numpage = 16
    elif initchar == "i":
        numpage = 6
    elif initchar == "j":
        numpage = 5
    elif initchar == "k":
        numpage = 5
    elif initchar == "l":
        numpage = 14
    elif initchar == "m":
        numpage = 28
    elif initchar == "n":
        numpage = 5
    elif initchar == "o":
        numpage = 9
    elif initchar == "p":
        numpage = 41
    elif initchar == "q":
        numpage = 3
    elif initchar == "r":
        numpage = 25
    elif initchar == "s":
        numpage = 67
    elif initchar == "t":
        numpage = 25
    elif initchar == "u":
        numpage = 2
    elif initchar == "v":
        numpage = 7
    elif initchar == "w":
        numpage = 11
    elif initchar == "xyz":
        numpage = 4
    for i in range(1,numpage+1):
        tlink = (istring + initchar + '/p/' + str(i))
        print tlink
        prototype2.link_spider(tlink)
#replace the argument in the command below:
url_generator("b")
