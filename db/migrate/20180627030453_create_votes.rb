class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|

      t.references :user, foreign_key: true
      t.references :card, foreign_key: true
      t.string :stylish

      t.timestamps
    end
    add_index :votes, [:card_id, :user_id], unique: true
  end
end
