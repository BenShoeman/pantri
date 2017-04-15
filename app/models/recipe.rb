class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients
  has_and_belongs_to_many :users

  def self.search(search)
    params = search.split(/,/) # Split by comma
    search_query = ""
    params.each do |param|
      param = param.strip().downcase()
      if not param.blank?
        search_query += "#{Ingredient.table_name}.name ilike '%" + param + "%' or "
      end
    end
    search_query = search_query[0..-5]

    recipes = Recipe.
      joins(:recipe_ingredients).joins(:ingredients).
      where(search_query).
      group("#{Recipe.table_name}.id").
      order("count(#{RecipeIngredient.table_name}.id) desc")

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
