class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :favorites, dependent: :destroy
  has_many :comments
  has_many :item_images, dependent: :destroy
  
  belongs_to :user, foreign_key: "exhibitor_id",class_name: "User"
  belongs_to :category, optional: true
  
  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  include Common_Module
  include ItemsShowMethods

  #出品時のvalidation
  accepts_nested_attributes_for :item_images , allow_destroy: true , reject_if: :all_blank
  validates :item_images , presence: true
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :category_id
    validates :status
    validates :preparation_day
    validates :exhibitor_id
    validates :delivery_fee
    validates :prefecture_id
  end
  with_options numericality: {
    greater_than_or_equal_to: 100,
    less_than_or_equal_to: 9999999} do
      validates :price
    end

  def self.search(search)
    if search
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  def self.search(search)
    if search
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
