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

ActiveRecord::Schema.define(version: 20180812080325) do

  create_table "comments", force: :cascade do |t|
    t.string   "post_id"
    t.integer  "comment_no"
    t.string   "comment_user_id"
    t.text     "comment_text"
    t.boolean  "del_flg"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "post_friends", force: :cascade do |t|
    t.string   "post_id"
    t.string   "post_user_id"
    t.string   "friend_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.string   "ytb_url"
    t.string   "post_user_id"
    t.boolean  "del_flg"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
