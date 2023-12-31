class CreateSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :suggestions do |t|
      t.text :content
      t.references :suggestionable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
