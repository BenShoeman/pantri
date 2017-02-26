class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :servings
      t.integer :prep_time
      t.integer :cook_time
      t.string :image_url

      t.timestamps
    end
  end
end
