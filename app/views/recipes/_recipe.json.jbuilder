json.extract! recipe, :id, :name, :servings, :prep_time, :cook_time, :image_url, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
