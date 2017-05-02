![pantri](http://i.imgur.com/bEtApYk.png)

## Team Members:
* Nabil Ettachfini ([@NabilEttachfini][nabil])
* Alex Hamlet ([@AlexanderHamlet][alex])
* Hoang Vu ([@KingstonRainsworth][kingston])
* Courtney Solano ([@courtsolano][courtney])
* Ben Shoeman ([@BenShoeman][ben])

[nabil]: https://github.com/NabilEttachfini "Nabil's GitHub"
[alex]: https://github.com/AlexanderHamlet "Alex's GitHub"
[kingston]: https://github.com/KingstonRainsworth "Kingston's GitHub"
[courtney]: https://github.com/courtsolano "Courtney's GitHub"
[ben]: https://github.com/BenShoeman "Ben's GitHub"

## Site Location

[pantri is now available here!][pantri]

[pantri]: https://pantri-search.herokuapp.com/ "pantri on Heroku"

## Description

[**pantri**][pantri] is a website that allow user to search recipes using their
inputted ingredients.

## Our Vision

Dinner Made Easy

## Motivation

We all have a lot of ingredients in our pantry, but we don’t know what to make with it.

## Risks

* First major software project
* Some members new to HTML, CSS, JavaScript
* Copyright risk
* Overflow of datas
* Security
* Server hosting

## Mitigation Strategy

* Working hard through problems, meet deadlines
* Learning HTML, CSS, JavaScript from members more experienced in these languages
* Link users to websites, instead of taking recipes as our own
* Overflow of datas solved by testing and designing a good algorithm
* Not asking for any personal information - just username and password
* Planned to host on colorado.edu servers, should have some security through those
* Hosting problems will be consult with the school server lender

## Requirements

### User Stories

ID | User Story | Size
---|------------|------
0 | As a user, I want to input my ingredients to a search bar and receive multiple recipes from trusted websites in order to find recipes that match my ingredients | 40
1 | As a user, I want my search results ordered by relevance | 13
2 | As a user, I want to be able to add and delete my ingredients so I can search for new recipes faster | 5
3 | As a user, I want to group ingredients by criteria such as price and common use in cooking, in order to make meals | 60
4 | As a user, I want to save recipes so I can use them later | 3
5 | As a site manager, I want to expand the list of available recipes, by adding my site to the list of trusted websites | 13

### Basic Requirements Summary

* Matching user input to Google search
* Account that stores ingredients with the option to remove items once used or gone bad
* List of needed ingredients, or search for only those ingredients
* User saved recipes
* Links to a couple trusted recipe websites with the title as the link

## Methodology

We will be using the AGILE method for pantri's development

## Project Tracking

* GitHub Issues and Milestones ([Repository Link](https://github.com/BenShoeman/pantri))
* [Project Plan](https://github.com/BenShoeman/pantri/milestones)
  ![Project Plan](http://i.imgur.com/Wn3jXdP.png)
* [Slack](https://pantriteam.slack.com/)

## Running the App Locally

You will need `rails` with the `rails` gem installed, in addition to `postgresql`.
`git clone` the repo, `cd` into the folder via terminal, run `bundle install` to
install dependencies, and run `rake db:create db:migrate` to initialize the DB.
Then run in the root directory using

```
rails s
```

## Running the Crawler Locally

There are a few requirements to run the crawler: you will need Python 2.7 as
well as the libraries BeautifulSoup4, psycopg2, and lxml/html5lib. You can
install all of these libraries in Python using `pip install <package>`; the
respective package names are `bs4`, `psycopg2`, and `lxml` or `html5lib`.

Then, as soon as you have initialized the database, just `cd` into the crawling
directory and run:

```
python recipe_importer.py <db_connection_string>
```

With PostgreSQL, the connection string most likely follows this format:

```
host=<IP addr./localhost> dbname=<dbname> user=<username> password=<password>
```

Locally, your connection string will most likely be (assuming your username is
postgres and your password is postgres):

```
host=localhost dbname=development user=postgres password=postgres
```

## Running the Test Suite

As long as you have `git clone`d the repository and have fulfilled all the
requirements for running the server locally, just run `rails test` in the root
directory to run the test suite.

## Building the Autodocs

First make sure you have fulfilled all the requirements to run the app locally.
Then, if you run `autodoc.sh`, the documentation will be generated for you. Convenient!
