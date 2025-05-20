class CreateUserPreferences < ActiveRecord::Migration[8.0]
  def change
    create_table :user_preferences do |t|
      t.string :name, null: false
      t.string :key, null: false
      t.text :value

      t.timestamps
    end

    add_index :user_preferences, :key
    add_index :user_preferences, [:name, :key], unique: true
  end
end
