class CreateAddresslevel2s < ActiveRecord::Migration
  def change
    create_table :addresslevel2s do |t|
      t.string :name
      t.integer :addresslevel3_id

      t.timestamps
    end
  end
end
