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

ActiveRecord::Schema.define(version: 20170802010308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "benches", force: :cascade do |t|
    t.string "description"
    t.float "lat"
    t.float "lng"
    t.integer "seating", default: 2, null: false
    t.string "picture_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "bench_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bench_id", "user_id"], name: "index_favorites_on_bench_id_and_user_id", unique: true
    t.index ["bench_id"], name: "index_favorites_on_bench_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "body", default: "", null: false
    t.integer "rating", null: false
    t.integer "bench_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bench_id"], name: "index_reviews_on_bench_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
