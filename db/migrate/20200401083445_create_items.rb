class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.integer :clothe_size
      t.string :brand
      t.string :status, null: false
      t.integer :preparation_day, null: false
      t.integer :exhibitor_id, foreign_key: true
      t.integer :buyer_id, foreign_key: true
      t.string :delivery_fee
      t.timestamps
    end
    add_index :items, [:name, :brand]
  end
end
