class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients
  has_and_belongs_to_many :users
  def saved_at
    nil
  end

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

  def saved?
    saved_at != nil
  end

  def save
    self.saved_at = Time.now
  end

  def save!
    save
    save!
  end

  def unsave
    self.saved_at = nil
  end

  def unsave!
    unsave
    save!
  end
end
