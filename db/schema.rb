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

ActiveRecord::Schema.define(version: 20150513013426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_photos", force: :cascade do |t|
    t.integer  "business_id"
    t.string   "photo"
    t.string   "caption"
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "business_photos", ["business_id"], name: "index_business_photos_on_business_id", using: :btree
  add_index "business_photos", ["review_id"], name: "index_business_photos_on_review_id", using: :btree
  add_index "business_photos", ["user_id"], name: "index_business_photos_on_user_id", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address_2"
    t.string   "city"
    t.string   "country_code"
    t.string   "cross_streets"
    t.string   "postal_code"
    t.string   "state_code"
    t.string   "phone"
    t.integer  "rating"
    t.string   "about"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "businesses_categories", id: false, force: :cascade do |t|
    t.integer "business_id", null: false
    t.integer "category_id", null: false
  end

  create_table "businesses_tags", id: false, force: :cascade do |t|
    t.integer "business_id", null: false
    t.integer "tag_id",      null: false
  end

  create_table "businesses_users", id: false, force: :cascade do |t|
    t.integer "business_id", null: false
    t.integer "user_id",     null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "accesstoken"
    t.string   "refreshtoken"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "nickname"
    t.string   "image"
    t.string   "phone"
    t.string   "urls"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "comment"
    t.boolean  "status"
    t.string   "status"
    t.integer  "menu_item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "likes", ["menu_item_id"], name: "index_likes_on_menu_item_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "menu_item_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "menu_item_id"
    t.integer  "menu_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "menu_item_categories", ["menu_id"], name: "index_menu_item_categories_on_menu_id", using: :btree
  add_index "menu_item_categories", ["menu_item_id"], name: "index_menu_item_categories_on_menu_item_id", using: :btree

  create_table "menu_item_photos", force: :cascade do |t|
    t.string   "photo"
    t.integer  "menu_item_id"
    t.string   "caption"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "menu_item_photos", ["menu_item_id"], name: "index_menu_item_photos_on_menu_item_id", using: :btree
  add_index "menu_item_photos", ["user_id"], name: "index_menu_item_photos_on_user_id", using: :btree

  create_table "menu_items", force: :cascade do |t|
    t.integer  "menu_id"
    t.string   "name"
    t.string   "description"
    t.float    "price"
    t.integer  "likes"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "menu_item_category_id"
  end

  add_index "menu_items", ["menu_id"], name: "index_menu_items_on_menu_id", using: :btree
  add_index "menu_items", ["menu_item_category_id"], name: "index_menu_items_on_menu_item_category_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "menus", ["business_id"], name: "index_menus_on_business_id", using: :btree

  create_table "reviews", force: :cascade do |t|

    t.integer  "rating"
    t.integer  "business_id"
    t.string   "body"
    t.integer  "rating"
    t.integer  "business_id"
    t.string   "body"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["business_id"], name: "index_reviews_on_business_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "username"
    t.datetime "oauth_expires_at"
    t.string   "oauth_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "business_photos", "businesses"
  add_foreign_key "business_photos", "reviews"
  add_foreign_key "business_photos", "users"
  add_foreign_key "identities", "users"
  add_foreign_key "likes", "menu_items"
  add_foreign_key "likes", "users"
  add_foreign_key "menu_item_categories", "menu_items"
  add_foreign_key "menu_item_categories", "menus"
  add_foreign_key "menu_item_photos", "menu_items"
  add_foreign_key "menu_item_photos", "users"
  add_foreign_key "menu_items", "menu_item_categories"
  add_foreign_key "menu_items", "menus"
  add_foreign_key "menus", "businesses"
  add_foreign_key "reviews", "businesses"
  add_foreign_key "reviews", "users"
end
