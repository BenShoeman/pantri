json.extract! ingredient, :id, :name, :times_searched, :recipe_id, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
