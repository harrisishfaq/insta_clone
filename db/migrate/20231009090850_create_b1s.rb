class CreateB1s < ActiveRecord::Migration[7.0]
  def change
    create_table :b1s do |t|
      t.string :name

      t.timestamps
    end
  end
end
