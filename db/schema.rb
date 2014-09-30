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

ActiveRecord::Schema.define(version: 20140930174458) do

  create_table "competition_strongs", force: true do |t|
    t.string   "title"
    t.integer  "project_strong_id"
    t.integer  "group_types_id"
    t.integer  "countrepeat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_types", force: true do |t|
    t.string   "name"
    t.integer  "project_strong_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_strongs", force: true do |t|
    t.boolean  "presence"
    t.integer  "project_strong_id"
    t.string   "name"
    t.string   "surname"
    t.string   "photopath"
    t.integer  "group_type_id"
    t.string   "city"
    t.string   "country"
    t.integer  "old"
    t.integer  "weight"
    t.integer  "height"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_strongs", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.integer  "project_types_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "result_strongs", force: true do |t|
    t.integer  "competition_strong_id"
    t.integer  "project_strong_id"
    t.integer  "player_strong_id"
    t.integer  "result1"
    t.boolean  "result1ok"
    t.integer  "result2"
    t.boolean  "result2ok"
    t.integer  "result3"
    t.boolean  "result3ok"
    t.integer  "result4"
    t.boolean  "result4ok"
    t.integer  "result5"
    t.boolean  "result5ok"
    t.integer  "result6"
    t.boolean  "result6ok"
    t.integer  "result7"
    t.boolean  "result7ok"
    t.integer  "result8"
    t.boolean  "result8ok"
    t.integer  "result9"
    t.boolean  "result9ok"
    t.integer  "result10"
    t.boolean  "result10ok"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
