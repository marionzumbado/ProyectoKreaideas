class CreateAddresslevel1s < ActiveRecord::Migration
  def change
    create_table :addresslevel1s do |t|
      t.string :name
      t.integer :addresslevel2_id

      t.timestamps
    end
  end
end
