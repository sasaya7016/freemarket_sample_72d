class CreateItemSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_sizes do |t|
      t.string :item_size, null: false
      t.string :ancestry
      t.timestamps
    end
  end
end