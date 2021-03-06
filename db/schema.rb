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

ActiveRecord::Schema.define(version: 20150313201826) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "logo"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.time     "time"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["category_id"], name: "index_events_on_category_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "frequencies", force: :cascade do |t|
    t.string "frequency"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.string  "comment"
  end

  add_index "reservations", ["event_id"], name: "index_reservations_on_event_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "rsvp_caps", force: :cascade do |t|
    t.integer "capacity"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.text     "description"
    t.string   "facebook"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.integer  "avatar_file_size"
    t.string   "avatar_content_type"
    t.datetime "avatar_updated_at"
  end

end
