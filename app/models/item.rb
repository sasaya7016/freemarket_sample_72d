class Item < ApplicationRecord
  has_many :favorites
  has_many :comments, throught: :comments
  has_many :item_images
  belongs_to :user
end
