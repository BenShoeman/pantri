class RemoveFieldNameFromTableName < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :password
  end
end
