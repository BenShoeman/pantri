class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.int :servings
      t.int :prep_time
      t.int :cook_time
      t.string :image_url

      t.timestamps
    end
  end
end
