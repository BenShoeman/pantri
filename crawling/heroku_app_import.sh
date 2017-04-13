#!/bin/bash

python recipe_importer.py "$(heroku pg:credentials DATABASE | grep -Po '(?<=\")[^\"]+(?=\")')"
