class ClothingArticle < ApplicationRecord
  URL_REGEXP = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
  belongs_to :user
  belongs_to :post
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 300 }
  validates :url, presence: true, format: { with: URL_REGEXP, message: 'is invalid' }
end
