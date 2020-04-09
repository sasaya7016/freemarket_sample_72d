class Item < ApplicationRecord
  has_many :favorites
  has_many :comments
  has_many :item_images
  belongs_to :user

  def self.search(search)
    if search
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

end
