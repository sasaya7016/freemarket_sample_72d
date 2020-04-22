class ItemImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item
  validates :item_id, presence: true
  validates :image, presence: true
end
