class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postalcode, null: false
      t.integer :prefecture_id, null:false
      t.string :first_address, null: false
      t.string :second_address, null: false
      t.string :third_address
      t.integer :phone_number
      t.references :user
      t.timestamps
    end
  end
end
