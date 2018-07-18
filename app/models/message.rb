class Message < ApplicationRecord
  validates :body, presence: true
  validates :email, presence: true
end