class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :favorites
  has_many :comments
  has_many :item_images
  belongs_to :user, optional: true
  belongs_to :category
  
  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  include Common_Module
  belongs_to :exhibitor, class_name: "User"

  def previous
    Item.where('id < ?',self.id).order('id DESC').first
  end

  def next
    Item.where('id > ?', self.id).order('id ASC').first
  end

  def self.search(search)
    if search
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
