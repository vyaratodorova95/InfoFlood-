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

ActiveRecord::Schema.define(version: 2020_02_23_173216) do

  create_table "country", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end


  create_table "location", force: :cascade do |t|
    t.decimal "long"
    t.decimal "lat"
    t.integer "area"
    t.integer "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_location_on_country_id"
  end

  create_table "search", force: :cascade do |t|
    t.decimal "long"
    t.decimal "lat"
    t.integer "area"
    t.date "began"
    t.date "ended"
    t.integer "dead"
    t.integer "displaced"
    t.string "maincause"
    t.integer "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_search_on_country_id"
  end

  
  add_foreign_key "location", "country"
  add_foreign_key "search", "country"
end
