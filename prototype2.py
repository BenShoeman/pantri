import requests
from bs4 import BeautifulSoup
import time
import re
import sys

def link_spider(url):
    source_code = requests.get(url)
    plain_text = source_code.text
    soup = BeautifulSoup(plain_text)
    for ul in soup.findAll('ul',{'class' : 'm-PromoList o-Capsule__m-PromoList'}):
        for li in ul.findAll('li',{'class' : 'm-PromoList__a-ListItem'}):
            for a in li.findAll('a'):
                print(a.get('href'))


link_spider('http://www.foodnetwork.com/recipes/a-z')
