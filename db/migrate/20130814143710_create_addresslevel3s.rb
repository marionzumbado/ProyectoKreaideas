class CreateAddresslevel3s < ActiveRecord::Migration
  def change
    create_table :addresslevel3s do |t|
      t.string :name

      t.timestamps
    end
  end
end
