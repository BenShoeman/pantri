class IncreaseUrlLength < ActiveRecord::Migration[5.0]
  def up
    change_column :recipes, :recipe_url, :string, :limit => 2083
    change_column :recipes, :image_url, :string, :limit => 2083
  end

  def down
    change_column :recipes, :recipe_url, :string, :limit => 64
    change_column :recipes, :image_url, :string, :limit => 64
  end
end
