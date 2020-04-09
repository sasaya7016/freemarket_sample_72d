class Item < ApplicationRecord
  has_many :favorites
  has_many :comments
  has_many :item_images
  belongs_to :user
  belongs_to :category
  
  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  include Common_Module
  belongs_to :exhibitor, class_name: "User"

  accepts_nested_attributes_for :item_images

  def previous
    Item.where('id < ?',self.id).order('id DESC').first
  end

  def next
    Item.where('id > ?', self.id).order('id ASC').first
  end

end
