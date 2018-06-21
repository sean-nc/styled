class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :image, presence: true
  validates :gender, presence: true, :inclusion => { :in => ["Male", "Female"] }
  validates :description, length: { maximum: 300 }
  validates :user_id, presence: true
end
