class Recipe < ApplicationRecord
  has_many :ingredients
  has_many :recipe_ingredients

  def self.search(search)
    Recipe.joins(:recipe_ingredients).joins(:ingredients).
      where("ingredients.name LIKE ?", "%#{search}%")
    # where("ingredients LIKE ?", "%#{search}%")
  end
end
