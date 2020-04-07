class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postalcode, :prefecture, :first_address, :second_address,presence: true
end
