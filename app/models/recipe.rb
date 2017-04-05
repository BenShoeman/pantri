class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients

  def self.search(search)
    params = search.split(/,/) # Split by comma
    search_query = ""
    params.each do |param|
      param = param.strip()
      search_query += "ingredients.name ilike '%" + param + "%' or "
    end
    search_query = search_query[0..-5]

    recipes = Recipe.joins(:recipe_ingredients).joins(:ingredients).
      where(search_query).distinct
      # where("ingredients.name ilike ?", "%#{search}%").uniq
    return recipes
  end

  def self.none()
    return where("1 = 0")
  end

  # def self.getIngredients(search)
  #   Recipe.joins(:recipe_ingredients).joins(:ingredients).
  #     where("ingredients.name ILIKE ?", "%#{search}%")
  # end
end
