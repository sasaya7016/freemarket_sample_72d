class Item < ApplicationRecord
  has_many :favorites
  has_many :comments
  has_many :item_images
  belongs_to :user
  belongs_to :category
  include Common_Module
  belongs_to :exhibitor, class_name: "User"

  def previous
    Item.where('id < ?',self.id).order('id DESC').first
  end

  def next
    Item.where('id > ?', self.id).order('id ASC').first
  end

end
