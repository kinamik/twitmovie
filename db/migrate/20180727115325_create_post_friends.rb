class CreatePostFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :post_friends do |t|
      t.string :post_id
      t.string :post_user_id
      t.string :friend_id

      t.timestamps
    end
  end
end
