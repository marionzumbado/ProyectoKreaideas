class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :address
      t.string :password
      t.integer :points
      t.integer :addresslevel1_id

      t.timestamps
    end
  end
end
