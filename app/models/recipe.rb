class Recipe < ApplicationRecord
    has_many :ingredients
    has_many :recipe_ingredients
end

def self.search(search)
    where("ingredients ILIKE ?", "%#{search}%")
end
