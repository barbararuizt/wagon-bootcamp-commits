class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :votes, :integer, default: 0, null: false
    # TODO: your code here to create the posts table
  end
end
