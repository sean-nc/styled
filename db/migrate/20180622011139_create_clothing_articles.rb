class CreateClothingArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :clothing_articles do |t|
      t.string :url
      t.string :title
      t.text :description
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
