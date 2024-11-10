class RemoveBookIdFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :book_id, :integer
  end
end
