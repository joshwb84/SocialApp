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

ActiveRecord::Schema.define(version: 0) do

  create_table "categories", force: :cascade do |t|
    t.string "category"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_title"
    t.text   "description"
    t.date   "date"
    t.time   "time"
    t.string "location"
  end

  create_table "frequencies", force: :cascade do |t|
    t.string "frequency"
  end

  create_table "meetups", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.integer "category_id"
  end

  add_index "meetups", ["category_id"], name: "index_meetups_on_category_id"
  add_index "meetups", ["event_id"], name: "index_meetups_on_event_id"
  add_index "meetups", ["user_id"], name: "index_meetups_on_user_id"

  create_table "rsvp_caps", force: :cascade do |t|
    t.integer "capacity"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
  end

end
