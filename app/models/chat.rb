class Chat < ApplicationRecord
  has_many :msgs, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
  validates :identifier, presence: true, uniqueness: true, case_sensitive: false
end