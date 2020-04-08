class Item < ApplicationRecord
  has_many :favorites
  has_many :comments
  has_many :item_images
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :introduction, presence: true
  validates :category_id, presence: true
  validates :brand, presence: true
  validates :status, presence: true
  validates :delivery_fee, presence: true
  validates :prefecture_id, presence: true
  validates :preparation_day, presence: true
  validates :price, presence: true


  
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

end
