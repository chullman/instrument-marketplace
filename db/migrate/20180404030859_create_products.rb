class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.text :description
      t.string :category
      t.string :brand
      t.boolean :visible

      t.timestamps
    end
  end
end
