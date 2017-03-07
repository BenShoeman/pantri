class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients

  def self.search(search)
    Recipe.joins(:recipe_ingredients).joins(:ingredients).
      where("ingredients.name ILIKE ?", "%#{search}%").uniq
  end

  def self.none()
    where("1 = 0")
  end

  # def self.getIngredients(search)
  #   Recipe.joins(:recipe_ingredients).joins(:ingredients).
  #     where("ingredients.name ILIKE ?", "%#{search}%")
  # end
end
