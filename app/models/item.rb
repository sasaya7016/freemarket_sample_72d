class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :favorites
  has_many :comments
  has_many :item_images
  belongs_to :user
end
