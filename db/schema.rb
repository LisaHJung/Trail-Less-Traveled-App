# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 2020_04_13_225232) do


  create_table "hikers", force: :cascade do |t|
    t.string "name"
    t.datetime "member_since"
    t.integer "followers"
    t.string "stats"
  end

  create_table "hiking_trails", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "difficulty_level"
    t.integer "distance"
    t.string "traffic"
    t.integer "elevation"
    t.string "rout_type"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "hiker_id"
    t.integer "hiking_trail_id"
    t.integer "rating"
    t.string "user_comment"

    t.index ["hiker_id"], name: "index_reviews_on_hiker_id"
    t.index ["hiking_trail_id"], name: "index_reviews_on_hiking_trail_id"
  end

  add_foreign_key "reviews", "hikers"
  add_foreign_key "reviews", "hiking_trails"
end
