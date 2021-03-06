class Post < ApplicationRecord
  COLOUR_OPTIONS = %w(White Black Grey Yellow Red Blue Green Brown Pink Orange Purple)
  STYLE_OPTIONS = %w(Boho Business Casual Classic Formal Grunge Preppy Street Sporty Trendy Vintage)
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :clothing_articles, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :image, presence: true
  validates :gender, presence: true, inclusion: { in: ["Male", "Female"] }
  validates :description, length: { maximum: 300 }
  validates :user_id, presence: true
  validates :style, inclusion: { in: STYLE_OPTIONS }, allow_blank: true
  validate :correct_colours


  def self.search(term, gender, colours, style)
    query_obj = self.all
    query_obj = query_obj.where('description ILIKE ?', "%#{term}%") unless term.blank?
    query_obj = query_obj.where(gender: gender) unless gender.blank? || gender == "Both"
    query_obj = query_obj.where("colours && ARRAY[?]::varchar[]", colours) unless colours.blank?
    query_obj = query_obj.where(style: style) unless style.blank?

    query_obj.order("random()")
  end

  private

  def correct_colours
    unless colours.nil?
      if colours.any? { |colour| COLOUR_OPTIONS.exclude?(colour) }
        errors.add(:post, "includes invalid colours")
      end
    end
  end
end