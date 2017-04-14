class CreateUserComments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_comments do |t|
      t.string :subject
      t.text :comment

      t.timestamps
    end
  end
end
