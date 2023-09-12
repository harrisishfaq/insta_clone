class AddColToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_no, :string
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :gender, :string
  end
end
