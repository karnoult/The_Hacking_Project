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

ActiveRecord::Schema.define(version: 20171106111723) do

  create_table "airports", force: :cascade do |t|
    t.string "airport_code", limit: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_code"], name: "index_airports_on_airport_code", unique: true
  end

  create_table "flights", force: :cascade do |t|
    t.integer "duration"
    t.datetime "departure_date"
    t.integer "departure_airport_id"
    t.integer "arrival_airport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_airport_id"], name: "index_flights_on_arrival_airport_id"
    t.index ["departure_airport_id"], name: "index_flights_on_departure_airport_id"
  end

end
