class AddThingsToUser < ActiveRecord::Migration
  def change
	add_column :users, :name, :string
	add_column :users, :phone, :integer
	add_column :users, :address, :string
	add_column :users, :points, :integer
  end
end
