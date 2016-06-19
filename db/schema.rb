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

ActiveRecord::Schema.define(version: 20160619171818) do

  create_table "accounts", force: :cascade do |t|
    t.string   "handle",          limit: 255
    t.integer  "crowd_tangle_id", limit: 4
    t.string   "name",            limit: 255
    t.string   "platform",        limit: 255
    t.string   "profileImage",    limit: 255
    t.integer  "subscriberCount", limit: 4
    t.string   "url",             limit: 255
    t.boolean  "verified"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "media_items", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.text     "full",       limit: 65535
    t.integer  "height",     limit: 4
    t.integer  "width",      limit: 4
    t.text     "type",       limit: 65535
    t.string   "url",        limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "account_id",      limit: 4
    t.text     "caption",         limit: 65535
    t.datetime "date"
    t.text     "expandedLinks",   limit: 65535
    t.integer  "crowd_tangle_id", limit: 8
    t.string   "link",            limit: 255
    t.text     "media",           limit: 65535
    t.text     "message",         limit: 65535
    t.string   "platform",        limit: 255
    t.string   "postUrl",         limit: 255
    t.decimal  "score",                         precision: 25, scale: 20
    t.integer  "statistics_id",   limit: 4
    t.integer  "subscriberCount", limit: 4
    t.text     "type",            limit: 65535
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.integer  "post_id",               limit: 4
    t.integer  "actual_likeCount",      limit: 4
    t.integer  "actual_shareCount",     limit: 4
    t.integer  "actual_commentCount",   limit: 4
    t.integer  "expected_likeCount",    limit: 4
    t.integer  "expected_shareCount",   limit: 4
    t.integer  "expected_commentCount", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
