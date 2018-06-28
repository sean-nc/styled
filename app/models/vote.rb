class Vote < ApplicationRecord
  belongs_to :card
  belongs_to :user
  validates :user_id, presence: true
  validates :card_id, presence: true
  validates :stylish, presence: true, :inclusion => { :in => ["Yes", "No"] }
  scope :upvotes, -> { where(stylish: "Yes") }
  scope :downvotes, -> { where(stylish: "No") }

  def upvote
    self.stylish = "Yes"
  end

  def downvote
    self.stylish = "No"
  end
end