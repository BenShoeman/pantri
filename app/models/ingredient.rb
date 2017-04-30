# == Schema Information
#
# Table name: ingredients
#
#  id             :integer          not null, primary key
#  name           :string
#  times_searched :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Ingredients are just as essential as Recipes are in the database. Ingredients
# are what you search for to get the Recipes that contain them.

class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
end
