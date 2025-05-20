class CreatePreferenceQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :preference_questions do |t|
      t.references :category, null: false, foreign_key: { to_table: :preference_categories }
      t.string :key, null: false
      t.string :label, null: false
      t.text :description
      t.string :question_type, null: false
      t.text :default_value
      t.boolean :required, default: false, null: false
      t.integer :position, default: 0, null: false
      t.json :options

      t.timestamps
    end

    add_index :preference_questions, [:category_id, :key], unique: true
    add_index :preference_questions, :key
    add_index :preference_questions, :position
  end
end
