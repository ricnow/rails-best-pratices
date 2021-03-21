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

ActiveRecord::Schema.define(version: 2021_01_31_003134) do

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "avatar_name"
    t.string "username"
    t.string "title"
    t.text "body"
    t.integer "status", default: 0
    t.integer "likes"
    t.float "relevance", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "widget_id"
    t.index ["widget_id"], name: "index_posts_on_widget_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.string "task_type"
    t.datetime "scheduled_to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "widgets", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.text "description"
    t.integer "board_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_widgets_on_board_id"
  end

end
