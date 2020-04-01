class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :comments, through: :comments
  has_many :favorites
  has_one :credit_card
  has_one :address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
