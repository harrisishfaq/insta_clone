class AddColumnTypeInPosts < ActiveRecord::Migration[7.0]
  def change
   change_column :posts , :content, :rich_text
  end
end
