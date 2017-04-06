# Pantri

## The Team

* Nabil Ettachfini (@NabilEttachfini)
* Alex Hamlet (@AlexanderHamlet)
* Hoang Vu (@KingstonRainsworth)
* Courtney Solano (@courtsolano)
* Ben Shoeman (@BenShoeman)

## Vision Statement

Dinner Made Easy.

## Automated Tests

We ran automated test cases using Ruby on Rails' own testing tool. To run it
yourself, make sure you have Ruby, Rails, and Postgresql. If you don't have the
libraries required (i.e., if `rails server` throws errors) run:
```
bundle install
```
Then make sure you create the database so that it can run the test suite on the
database:
```
rake db:create db:migrate
```
Finally, run the test suite:
```
rails test
```
If you have errors, feel free to ask Ben (besh3382@colorado.edu) and he can show
it to you on his machine. Postgres is very picky when it comes to users. :)

### Automated Test Screenshot:
![Automated Tests Running](http://i.imgur.com/20K9Wex.png)

## User Acceptance Tests

### Test 1

Use Case Name:
>  Search with one ingredient

Description:
>  Test searching with one ingredient

Pre-Conditions:
>  None

Test Steps:
>  1. Navigate to root page
>  2. Type ingredient in search box, no commas
>  3. Press enter or click search button

Expected Result:
>  User should get list of recipes that contain that ingredient

Actual Result:
>  User gets list of recipes that contain that ingredient

Status (Pass/Fail):
>  Pass

Notes:
>  N/A

Post-Conditions:
>  User gets list of recipes with the relevant ingredient

### Test 2

Use Case Name:
>  Search with several ingredients

Description:
>  Test searching with several ingredients

Pre-Conditions:
>  None

Test Steps:
>  1. Navigate to root page
>  2. Type ingredients in search box delimited by commas
>  3. Press enter or click search button

Expected Result:
>  User should get list of recipes that contain any of the ingredients

Actual Result:
>  User gets list of recipes that contain any of the ingredients

Status (Pass/Fail):
>  Pass

Notes:
>  N/A

Post-Conditions:
>  User gets list of recipes with relevant ingredients

### Test 3

Use Case Name:
>  Search with ingredient that isn't in any recipe in the database

Description:
>  Test searching with ingredient that isn't in the database

Pre-Conditions:
>  None

Test Steps:
>  1. Navigate to root page
>  2. Type ingredient not in the database in the search box, no commas
>  3. Press enter or click search button

Expected Result:
>  User should get no recipes; page should display "no recipes found"

Actual Result:
>  User gets no recipes, with page displaying "no recipes found"

Status (Pass/Fail):
>  Pass

Notes:
>  N/A

Post-Conditions:
>  User gets no recipes because ingredient isn't in the database
