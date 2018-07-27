class CreateMsgs < ActiveRecord::Migration[5.2]
  def change
    create_table :msgs do |t|
      t.text :content
      t.integer :user_id
      t.integer :chat_id

      t.timestamps
    end
  end
end
