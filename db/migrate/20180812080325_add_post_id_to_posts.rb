class AddPostIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :post_id, :string
  end
end
