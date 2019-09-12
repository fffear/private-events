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

ActiveRecord::Schema.define(version: 2019_09_11_040942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_attendances", force: :cascade do |t|
    t.integer "attendee_id", null: false
    t.integer "attended_event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attended_event_id", "attendee_id"], name: "index_event_attendances_on_attended_event_id_and_attendee_id", unique: true
    t.index ["attendee_id"], name: "index_event_attendances_on_attendee_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "date", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.integer "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_events_on_creator_id"
    t.index ["title"], name: "index_events_on_title"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name"
  end

end
