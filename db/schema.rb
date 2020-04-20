ActiveRecord::Schema.define(version: 2020_04_13_225229) do

  create_table "hikers", force: :cascade do |t|
    t.string "name"
  end

  create_table "hiking_trails", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "difficulty_level"
    t.integer "distance"
    t.string "traffic"
    t.integer "elevation"
    t.string "address"
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
