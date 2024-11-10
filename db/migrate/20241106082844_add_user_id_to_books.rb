class AddUserIdToBooks < ActiveRecord::Migration[7.2]
  def change
    add_column :books, :user_id, :integer
    add_foreign_key :books, :users
    add_index :books, :user_id
  end
end
