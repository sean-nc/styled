class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.string :image
      t.string :gender

      t.timestamps
    end
  end
end
