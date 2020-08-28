class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :department, :string
  end
end
