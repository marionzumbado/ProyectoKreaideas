class CreateKreaideasusers < ActiveRecord::Migration
  def change
    create_table :kreaideasusers do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :address
      t.integer :points
      t.string :hashed_password
      t.string :salt
      t.integer :addresslevel1_id

      t.timestamps
    end
  end
end
