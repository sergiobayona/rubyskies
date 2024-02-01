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

ActiveRecord::Schema[7.1].define(version: 2024_01_31_190231) do
  create_table "locations", force: :cascade do |t|
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country", "postal_code"], name: "index_locations_on_country_and_postal_code"
  end

  create_table "weathers", force: :cascade do |t|
    t.string "postal_code"
    t.string "country"
    t.json "data"
    t.boolean "cached_weather", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country", "postal_code"], name: "index_weathers_on_country_and_postal_code"
  end

end
