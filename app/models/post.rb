class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :clothing_articles, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :image, presence: true
  validates :gender, presence: true, :inclusion => { :in => ["Male", "Female"] }
  validates :description, length: { maximum: 300 }
  validates :user_id, presence: true

  def self.search(term, gender)
    if gender == "Both" || gender.nil?
      if term
        self.where('description ILIKE ?', "%#{term}%").order("random()")
      else
        self.all.order("random()")
      end
    else
      if term
        self.where('description ILIKE ?', "%#{term}%").where(gender: gender).order("random()")
      else
        self.where(gender: gender).order("random()")
      end
    end
  end
end