class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :request_status
      t.string :friendship_status

      t.timestamps
    end
  end
end
