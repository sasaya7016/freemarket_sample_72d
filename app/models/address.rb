class Address < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  validates :postalcode, :prefecture_id, :first_address, :second_address,presence: true
