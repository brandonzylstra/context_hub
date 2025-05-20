# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_20_194556) do
  create_table "preference_categories", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_preference_categories_on_name", unique: true
  end

  create_table "preference_questions", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "key", null: false
    t.string "label", null: false
    t.text "description"
    t.string "question_type", null: false
    t.text "default_value"
    t.boolean "required", default: false, null: false
    t.integer "position", default: 0, null: false
    t.json "options"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id", "key"], name: "index_preference_questions_on_category_id_and_key", unique: true
    t.index ["category_id"], name: "index_preference_questions_on_category_id"
    t.index ["key"], name: "index_preference_questions_on_key"
    t.index ["position"], name: "index_preference_questions_on_position"
  end

  create_table "user_preferences", force: :cascade do |t|
    t.string "name", null: false
    t.string "key", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_user_preferences_on_key"
    t.index ["name", "key"], name: "index_user_preferences_on_name_and_key", unique: true
  end

  add_foreign_key "preference_questions", "preference_categories", column: "category_id"
end
