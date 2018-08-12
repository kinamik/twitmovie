class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :ytb_url
      t.string :post_user_id
      t.boolean :del_flg

      t.timestamps
    end
  end
end
