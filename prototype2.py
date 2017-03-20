import requests
from bs4 import BeautifulSoup
import time
import re
import sys
import json

def link_spider(url):
    source_code = requests.get(url)
    plain_text = source_code.text
    soup = BeautifulSoup(plain_text)
    for ul in soup.findAll('ul',{'class' : 'm-PromoList o-Capsule__m-PromoList'}):
        for li in ul.findAll('li',{'class' : 'm-PromoList__a-ListItem'}):
            for a in li.findAll('a'):
                time.sleep(5)
                print(a.get('href'))
                recipe_url = a.get('href')
                recipe_spider(recipe_url)

def recipe_spider(urls):
    try:
        source_code = requests.get(urls)
        plain_text = source_code.text
        soup = BeautifulSoup(plain_text)
        for info in soup.findAll('script',{"type" : "application/ld+json"}):
            json_string = str(info)
            startcheck = json_string.find("{")
            json_stringp = json_string[startcheck:]
            json_stringp = json_stringp.replace("</script>","")
            #print(json_stringp)
            json_object = json.loads(json_stringp)
            print json_object['name']
    except requests.exceptions.TooManyRedirects as e:
        print "Error: Too many redirects."

link_spider('http://www.foodnetwork.com/recipes/a-z')
#recipe_spider('http://www.foodnetwork.com/recipes/caesar-salad-recipe')
