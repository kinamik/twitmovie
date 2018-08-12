class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :post_id
      t.integer :comment_no
      t.string :comment_user_id
      t.text :comment_text
      t.boolean :del_flg

      t.timestamps
    end
  end
end
