class ItemImage < ApplicationRecord
  mount_uploaders :image, ImageUploader
  belongs_to :item

  #validates :url, presence: true
end
