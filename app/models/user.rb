class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :comments, through: :comments
  has_many :favorites, dependent: :destroy
  has_many :favorite_items, through: :favorites, source: :item
  has_one :credit_card
  has_one :address


  devise :database_authenticatable, :registerable,

         :recoverable, :rememberable, :validatable, password_length: 7..100

  validates :lastname, :firstname, :firstnameKANA, :lastnameKANA, :nickname, :birth_date, presence: true

end
