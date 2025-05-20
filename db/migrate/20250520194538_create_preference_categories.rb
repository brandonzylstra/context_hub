class CreatePreferenceCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :preference_categories do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :preference_categories, :name, unique: true
  end
end
