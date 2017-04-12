import requests
from bs4 import BeautifulSoup
import time
import re
import sys
import json
import psycopg2

from filter_regexes import *

def link_spider(url, dbcon):
    source_code = requests.get(url)
    plain_text = source_code.text
    soup = BeautifulSoup(plain_text)
    for ul in soup.findAll('ul',{'class' : 'm-PromoList o-Capsule__m-PromoList'}):
        for li in ul.findAll('li',{'class' : 'm-PromoList__a-ListItem'}):
            for a in li.findAll('a'):
                time.sleep(2.5)
                recipe_url = a.get('href')
                recipe_spider(recipe_url, dbcon)

def recipe_spider(recipe_url, dbcon):
    try:
        source_code = requests.get(recipe_url)
        plain_text = source_code.text
        soup = BeautifulSoup(plain_text)
        for info in soup.findAll('script',{"type" : "application/ld+json"}):
            json_string = str(info).replace("\n","").replace("\t","")
            startcheck = json_string.find("{")
            json_stringp = json_string[startcheck:]
            json_stringp = json_stringp.replace("</script>","")
            json_object = json.loads(json_stringp)

            recipe_name = ""
            recipe_imageurl = ""
            recipe_cooktime = 0
            recipe_preptime = 0
            recipe_totaltime = 0
            recipe_yield = 0

            print recipe_url

            # Name of Recipe
            try:
                recipe_name = json_object["name"]
                # Remove quotes for SQL query just in case
                recipe_name = re.sub(r'[\"\']', '', recipe_name)
            except KeyError:
                print "No name, not adding this recipe to the DB"
                dbcon.rollback()
                continue # don't use this link since we don't have a name

            # URL of Image
            try:
                recipe_imageurl = json_object["image"]["url"]
            except KeyError:
                print "No image"

            # Cook time
            try:
                recipe_cooktime = json_object["cookTime"]
                time = re.split(r'[PYMDTHMS]', recipe_cooktime)
                # Time in database is in minutes, so take hours*60 + minutes
                recipe_cooktime = int(time[5]) * 60 + int(time[6])
            except KeyError:
                print "No cook time"

            # Prep time
            try:
                recipe_preptime = json_object["prepTime"]
                time = re.split(r'[PYMDTHMS]', recipe_preptime)
                # Time in database is in minutes, so take hours*60 + minutes
                recipe_preptime = int(time[5]) * 60 + int(time[6])
            except KeyError:
                print "No prep time"

            # Total time
            try:
                recipe_totaltime = json_object["totalTime"]
                time = re.split(r'[PYMDTHMS]', recipe_totaltime)
                # Time in database is in minutes, so take hours*60 + minutes
                recipe_totaltime = int(time[5]) * 60 + int(time[6])
            except KeyError:
                print "No total time; using prep time + cook time"
                recipe_totaltime = recipe_preptime + recipe_cooktime

            # Servings/Yield
            try:
                recipe_yield = json_object["recipeYield"]
                numbers = re.findall(r'\d+', recipe_yield)
                if (len(numbers) > 0):
                    recipe_yield = int(numbers[0])
                else:
                    raise KeyError
            except KeyError:
                print "No servings/yield"

            cur = dbcon.cursor()
            query = "insert into recipes (name, servings, prep_time, cook_time, total_time, recipe_url, image_url, created_at, updated_at) values ('%s', %d, %d, %d, %d, '%s', '%s', now(), now()) returning id;" % (recipe_name, recipe_yield, recipe_preptime, recipe_cooktime, recipe_totaltime, recipe_url, recipe_imageurl)

            print "Running query: %s" % query
            cur.execute(query)

            recipe_id = cur.fetchone()[0]
            print "New recipe ID is %d" % recipe_id

            # Ingredients list
            # This code isn't pretty but we're not looking for optimized code anyway
            # since we don't want to flood their servers with requests
            try:
                ingsList = json_object["recipeIngredient"]
                for ing in ingsList:
                    ing = ing.lower().strip() # Convert to lowercase and remove unnecessary whitespace

                    # If it's for serving or optional, it's not an essential recipe so omit it
                    if optional_regex.search(ing) is not None:
                        continue

                    ing = parenthetical_regex.sub('', ing) # Remove parenthetical items
                    ing = punctuation_regex.sub('', ing) # Remove other extraneous punctuation
                    ing = adjectives_regex.sub('', ing) # Remove unnecessary adjectives
                    ing = number_regex.sub('', ing) # Remove leading digits
                    ing = unit_regex.sub('', ing) # Remove units and numbers
                    ing = comma_regex.sub('', ing) # Remove anything after commas
                    ing = branding_regex.sub('', ing) # Remove any brand names, fuck that shit

                    ing = ing.strip() # Remove unnecessary whitespace

                    # Add other ingredients if we have an "and/or" within the ingredients
                    # We'll have to exit this loop iteration and add them later
                    if conj_removal_regex.search(ing) is not None:
                        subings = conj_regex.split(ing)
                        for subing in subings:
                            subing = conj_removal_regex.sub('', subing)
                            json_object["recipeIngredient"].append(subing)
                        continue

                    # Check if string is blank for some reason and don't put it in if so
                    if ing != "":
                        # Getting ingredient ID by first looking for the ingredient
                        # and if we find it, use that ID.
                        # Otherwise, we'll make a new entry in the ingredients table
                        # Finally, make an entry linking the recipe and ingredients
                        cur.execute("select id from ingredients where name ilike '%%%s%%';" % ing)
                        # If we didn't get anything from that query
                        if cur.rowcount < 1:
                            query = "insert into ingredients (name, created_at, updated_at) values ('%s', now(), now()) returning id;" % ing
                            print "Running query: %s" % query
                            cur.execute(query)
                        # Whether we made a new ingredient or got an existing one, get the ID
                        ing_id = cur.fetchone()[0]

                        # Make sure this ingredient wasn't already added
                        cur.execute("select id from recipe_ingredients where recipe_id = %d and ingredient_id = %d;" % (recipe_id, ing_id))
                        if cur.rowcount > 0:
                            continue # Go to next ingredient since this one already exists

                        # Now link the recipe and ingredient
                        query = "insert into recipe_ingredients (recipe_id, ingredient_id, created_at, updated_at) values (%d, %d, now(), now());" % (recipe_id, ing_id)
                        print "Running query: %s" % query
                        cur.execute(query)
            except KeyError:
                print "No ingredients, not adding this recipe to the DB"
                dbcon.rollback()
                continue # don't use this link since we don't have ingredients

            dbcon.commit()

    except requests.exceptions.TooManyRedirects as e:
        print "Error: Too many redirects."
        dbcon.rollback()
    except requests.exceptions.MissingSchema as e:
        print "Error: Missing schema."
        dbcon.rollback()
    except psycopg2.ProgrammingError as e:
        print "SQL Programming Error:", e.message
        dbcon.rollback()
    except ValueError as e:
        print "Value error:", e.message
    finally:
        print ""
