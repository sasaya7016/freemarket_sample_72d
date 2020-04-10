class Item < ApplicationRecord
  has_many :favorites
  has_many :comments
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true
  belongs_to :user, optional: true
  belongs_to :category
  belongs_to :exhibitor, class_name: "User"
  
  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  include Common_Module

  def previous
    Item.where('id < ?',self.id).order('id DESC').first
  end

  def next
    Item.where('id > ?', self.id).order('id ASC').first
  end

end
