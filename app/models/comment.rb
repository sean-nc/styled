class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :body, presence: true, length: { maximum: 600 }
  belongs_to :post
  belongs_to :user
end