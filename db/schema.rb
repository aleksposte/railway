# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161123093325) do

  create_table "carriages", force: :cascade do |t|
    t.integer  "number",            default: 0
    t.string   "type_carriage"
    t.integer  "top_seats"
    t.integer  "bottom_seats"
    t.integer  "train_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "side_top_seats"
    t.integer  "side_bottom_seats"
    t.integer  "seat_seats"
    t.string   "type"
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer  "railway_station_id"
    t.integer  "route_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "station_number"
    t.integer  "position"
    t.string   "arrival_time"
    t.string   "departure_time"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "start_station_id"
    t.integer  "end_station_id"
    t.string   "number"
    t.string   "passenger_name"
    t.string   "passport_number"
    t.integer  "user_id"
    t.integer  "train_id"
  end

  add_index "tickets", ["end_station_id"], name: "index_tickets_on_end_station_id"
  add_index "tickets", ["start_station_id", "end_station_id"], name: "index_tickets_on_start_station_id_and_end_station_id"
  add_index "tickets", ["start_station_id"], name: "index_tickets_on_start_station_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "trains", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "route_id"
    t.integer  "current_station_id"
    t.boolean  "sort_order",         default: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
