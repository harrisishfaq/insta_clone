class UpdateColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :friends , :request_status , :string , :default => 'pending'
  end
end
