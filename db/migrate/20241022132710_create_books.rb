class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :titile
      t.string :author
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
