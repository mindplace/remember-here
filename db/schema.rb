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

ActiveRecord::Schema.define(version: 20161229014244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "list_places", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "place_id"
    t.text     "notes",      default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["list_id"], name: "index_list_places_on_list_id", using: :btree
    t.index ["place_id"], name: "index_list_places_on_place_id", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.string   "title",                    null: false
    t.text     "description", default: ""
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_lists_on_user_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "title",                   null: false
    t.string   "address",                 null: false
    t.string   "website",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "list_places", "lists"
  add_foreign_key "list_places", "places"
  add_foreign_key "lists", "users"
end
