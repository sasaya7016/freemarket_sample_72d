class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true

  validates :message, presence: true, 
            length: { maximum: 35 }
  validates :user_id, presence: true 
  validates :item_id, presence: true
end
