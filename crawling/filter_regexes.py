import re

optional_regex = re.compile(r'(for serving|optional|to taste|for garnish|serving suggestion)')
number_regex = re.compile(ur'^(\d+ |[\u00bc\u00bd\u00be\u2153\u2154] )?\d+/?\d*( to (\d+ )?\d+/?\d*)?[ \-\.]', re.UNICODE)
parenthetical_regex = re.compile(r'(\([^)]\)|\(.*$)*')
comma_regex = re.compile(r'(,|recommended\:|plus|such as|with|cut into)(?!( and | or )).*$')
branding_regex = re.compile(ur'^.*\u00ae ?', re.UNICODE)
unit_regex = re.compile(r'^(a |about )?(few |rounded )?(t|tsp|teaspoon|tbl|tbs|tbsp|tablespoon|fluid ounce|fl oz|c|cup|p|pt|pint|q|qt|quart|g|gal|gallon|ml|millilit(er|re)|cc|l|lit(er|re)|lb|pound|oz|ounce|mg|milligram(me)?|g|gram(me)?|kg|kilogram(me)?|mm|millimet(er|re)|cm|centimet(er|re)|m|met(er|re)|in|inch(e)?|slice|jar|box(e)?|head|clove|can|container|bunch(e)?|stalk|stick|pinch(e)?|handful|bouquet|sprig|whole|strip|piece|loaf|bottle|slab|(full )?rack|ear|rib|bag|canister|dash|pack|dozen|lea(f|ve)|bar)[s\.]? (of )?')
adjectives_regex = re.compile(r'(?:(?<=[ \.\-])|(?<=^))(roasted|(un)?salted|crispy?|cooked|refrigerated|small|medium|large|diced|chopped|sweetened|fresh(ly)?|sliced|salted|grated|coarse(ly)?|fine(ly)?|minced|toasted|pure|lightly|packed|crushed|original|no\-stick|jumbo|dried|thin(ly)?|thick|chinese|mini|kraft|deluxe|process|deli|trimmed|softened|good|quality|lots|smoked|prepared|firm(ly)?|recipe|quick|hungarian|nancys|one|two|three|four|five|six|seven|eight|nine|ten|your|favorite|sized?|shredded|boneless|skinless|extra\-virgin|loosely|jamies|store\-bought|premium|warm|ice|cold|neelys?|frozen|pickled|individual|ripe|lean|(un)?filtered|leftover|low\-sodium|full|pre|other|blanched|mixed|basic|peeled|beaten|nonstick|stackable|reduced\-fat|plain|several|roughly|cleaned|pureed|deveined|\d+\-(inch|ounce)|to)[ ,\-]')
punctuation_regex = re.compile(r'[\"\'\!/\*\:]*')
conj_regex = re.compile(r',? (?:and|or) ')
conj_removal_regex = re.compile(r'(?:(?<= )|(?<=^))(and|or)(?:(?= )|(?=$))')
