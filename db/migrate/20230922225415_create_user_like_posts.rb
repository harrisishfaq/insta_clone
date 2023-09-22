class CreateUserLikePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_like_posts do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
