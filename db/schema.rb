# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_08_041211) do

  create_table "relationship_of_follows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_relationship_of_follows_on_follow_id"
    t.index ["user_id", "follow_id"], name: "index_relationship_of_follows_on_user_id_and_follow_id", unique: true
    t.index ["user_id"], name: "index_relationship_of_follows_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.text "introduce"
    t.string "phonenumber"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img"
    t.string "adress"
    t.string "placeofactivity"
    t.string "hobby"
    t.string "sex"
    t.string "camera"
    t.string "lens"
    t.string "app"
  end

  create_table "videoposts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "youtube_url"
    t.string "youtube_title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_videoposts_on_user_id"
  end

  add_foreign_key "relationship_of_follows", "users"
  add_foreign_key "relationship_of_follows", "users", column: "follow_id"
  add_foreign_key "videoposts", "users"
end
