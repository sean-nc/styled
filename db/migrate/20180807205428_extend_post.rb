class ExtendPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :colours, :string, array: true, default: []
    add_column :posts, :style, :string
  end
end
