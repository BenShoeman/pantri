# == Schema Information
#
# Table name: recipe_ingredients
#
#  id            :integer          not null, primary key
#  recipe_id     :integer
#  ingredient_id :integer
#  quantity      :integer
#  units         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# RecipeIngredients link recipes to the ingredients they contain. Each Recipe
# contains one or more RecipeIngredients (which in turn link to an Ingredient).

class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
end
