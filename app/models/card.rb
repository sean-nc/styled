class Card < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :votes, dependent: :destroy
  validates :user_id, presence: true
  validates :post_id, presence: true
  default_scope { order('created_at DESC') }
end
