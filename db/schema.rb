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

ActiveRecord::Schema.define(version: 20140823144034) do

  create_table "lists", force: true do |t|
    t.string   "name"
    t.string   "organization"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lists", ["user_id"], name: "index_lists_on_user_id"

  create_table "members", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "netid"
    t.string   "email"
    t.string   "year"
    t.string   "college"
    t.integer  "list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["list_id"], name: "index_members_on_list_id"

  create_table "users", force: true do |t|
    t.string   "netid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
