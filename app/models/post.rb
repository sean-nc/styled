class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :clothing_articles, dependent: :destroy
  has_many :cards, dependent: :destroy
  validates :image, presence: true
  validates :gender, presence: true, :inclusion => { :in => ["Male", "Female"] }
  validates :description, length: { maximum: 300 }
  validates :user_id, presence: true

  def self.search(term)
    if term
      self.where('description ILIKE ?', "%#{term}%").order("random()")

      # self.select('*')
      #     .where('posts.description ILIKE ?', "%#{term}%")
      #     .left_outer_joins(:clothing_articles)
      #     .select("CASE
      #             WHEN clothing_articles.title ILIKE '%#{term}%' THEN 1
      #             WHEN clothing_articles.description ILIKE '%#{term}%' THEN 1
      #             ELSE 0 END as score")
      #     .order('score DESC')

      # query = <<-QUERY.squish
      # SELECT *, CASE
      #   WHEN clothing_articles.title ILIKE :term THEN 1
      #   WHEN clothing_articles.description ILIKE :term THEN 1
      #   ELSE 0
      #   END
      # AS score
      # FROM "posts"
      # LEFT OUTER JOIN clothing_articles ON clothing_articles.post_id = posts.id
      # WHERE (posts.description ILIKE :term)
      # ORDER BY score DESC
      # QUERY

      # find_by_sql([query, :term => term])
    else
      self.all.order("random()")
    end
  end
end