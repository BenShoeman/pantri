class Ingredient < ApplicationRecord
  belongs_to :recipe
  has_many :recipe_ingredient
end
