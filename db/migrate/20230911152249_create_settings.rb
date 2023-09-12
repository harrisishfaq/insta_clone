class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.boolean :public , :default => false
      t.boolean :someone_can_comment_on_post , :default => true
      t.boolean :someone_can_search_me, :default => true
      t.boolean :someone_can_mention_me, :default => true
      t.boolean :account_status, :default => true
      t.boolean :show_me_in_suggestions, :default => true
      t.integer :user_id

      t.timestamps
    end
  end
end
