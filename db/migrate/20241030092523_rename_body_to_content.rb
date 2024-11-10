class RenameBodyToContent < ActiveRecord::Migration[7.2]
  def change
    rename_column :books, :titile, :title
  end
end
