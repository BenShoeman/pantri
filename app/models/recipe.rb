# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  name       :string
#  servings   :integer
#  prep_time  :integer
#  cook_time  :integer
#  total_time :integer
#  recipe_url :string(2083)
#  image_url  :string(2083)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Recipes are one of the essential structures of the database. When you search
# for Ingredients, you get back Recipes that have those Ingredients.

class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients
  has_and_belongs_to_many :users

  # Default saved_at value
  def saved_at
    nil
  end

  # Search the database for recipes given the ingredients provided in search.
  # *search* is the search query.
  def self.search(search, page = 1)
    items_per_page = 16

    params = search.split(/,/)
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
      order("count(#{Ingredient.table_name}.id) desc").
      limit(items_per_page).offset((page-1) * items_per_page)

    return recipes
  end

  # Returns true if recipe belongs to the user.
  def recipe_belongs_to_user(user)
    if user.recipes.select {|s| s.users == users}.count > 0
      return true
    else
      return false
    end
  end

  # Returns true if the recipe is saved.
  def saved?
    saved_at != nil
  end

  # Save the current recipe.
  def save
    self.saved_at = Time.now
  end

  # Perform save action.
  def save!
    save
    save!
  end

  # Unsave the current recipe.
  def unsave
    self.saved_at = nil
  end

  # Perform unsave action.
  def unsave!
    unsave
    save!
  end
end
