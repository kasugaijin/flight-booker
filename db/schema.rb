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

ActiveRecord::Schema[7.0].define(version: 2022_06_13_164759) do
  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "flight_id"
    t.integer "passenger_id"
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
    t.index ["passenger_id"], name: "index_bookings_on_passenger_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "number"
    t.integer "duration"
    t.string "aircraft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dept_airport_id"
    t.integer "arr_airport_id"
    t.date "date"
    t.string "time"
    t.index ["arr_airport_id"], name: "index_flights_on_arr_airport_id"
    t.index ["dept_airport_id"], name: "index_flights_on_dept_airport_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "unique_emails", unique: true
  end

  add_foreign_key "bookings", "flights"
  add_foreign_key "bookings", "passengers"
  add_foreign_key "flights", "airports", column: "arr_airport_id"
  add_foreign_key "flights", "airports", column: "dept_airport_id"
end
