class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def self.from_omniauth(auth)
       sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
       user = sns.user || User.where(email: auth.info.email).first_or_initialize(
         nickname: auth.info.name,
           email: auth.info.email
       )
       if user.persisted?
         sns.user = user
         sns.save
       end
       { user: user, sns: sns }
     end

  has_many :items
  has_many :comments, through: :comments
  has_many :favorites, dependent: :destroy
  has_many :favorite_items, through: :favorites, source: :item
  has_one :credit_card
  has_one :address
  
  mount_uploader :icon_image, UserIconUploader
  mount_uploader :background_image, UserBackgroundImageUploader

  include Common_Module
  include ClassMethods

  devise :database_authenticatable, :registerable,

         :recoverable, :rememberable, :validatable, password_length: 7..100

  validates :lastname, :firstname, :firstnameKANA, :lastnameKANA, :nickname, :birth_date, presence: true


end
