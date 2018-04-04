class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string, unique: true
    add_column :users, :role, :string
    add_column :users, :disabled, :boolean
  end
end
