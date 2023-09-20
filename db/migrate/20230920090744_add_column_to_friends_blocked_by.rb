class AddColumnToFriendsBlockedBy < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :blocked_by, :integer
  end
end
