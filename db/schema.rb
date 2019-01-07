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

ActiveRecord::Schema.define(version: 20190106121626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Items_Users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.index ["item_id", "user_id"], name: "index_Items_Users_on_item_id_and_user_id", using: :btree
    t.index ["user_id", "item_id"], name: "index_Items_Users_on_user_id_and_item_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "status"
    t.string   "Location"
    t.string   "specification"
    t.string   "description"
    t.string   "category"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.bigint   "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "user_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_user_items_on_item_id", using: :btree
    t.index ["user_id"], name: "index_user_items_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "name"
    t.string   "contact"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.bigint   "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  end

  add_foreign_key "user_items", "items"
  add_foreign_key "user_items", "users"
end
