class Vote < ApplicationRecord
  belongs_to :card
  belongs_to :user
  validates :user_id, presence: true
  validates :card_id, presence: true
  validates :vote, presence: true
  scope :upvotes, -> { where(vote: true) }
  scope :downvotes, -> { where(vote: false) }

  def upvote
    self.vote = true
  end

  def downvote
    self.vote = false
  end
end