class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.string :brand
      t.integer :category_id, null:false
      t.string :item_size
      t.string :status, null: false
      t.integer :favorites_count
      t.integer :preparation_day, null: false
      t.integer :exhibitor_id, foreign_key: true
      t.integer :buyer_id, foreign_key: true
      t.string :delivery_fee, null: false
      t.integer :prefecture_id, null: false, foreign_key: true
      t.timestamps
    end
    add_index :items, [:name, :brand]
  end
end
