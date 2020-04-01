class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postalcode
      t.string :prefecture
      t.string :town
      t.string :street
      t.string :building
      t.timestamps
    end
  end
end
