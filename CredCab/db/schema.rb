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

ActiveRecord::Schema.define(version: 20130619000347) do

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "course_date"
    t.integer  "credits"
    t.string   "certificate"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "credential_id"
  end

  add_index "courses", ["credential_id"], name: "index_courses_on_credential_id"
  add_index "courses", ["user_id"], name: "index_courses_on_user_id"

  create_table "courses_credentials", id: false, force: true do |t|
    t.integer "course_id",     null: false
    t.integer "credential_id", null: false
  end

  create_table "credentials", force: true do |t|
    t.string   "title"
    t.string   "issuing_authority"
    t.datetime "date_issued"
    t.datetime "last_renewal"
    t.datetime "next_renewal"
    t.string   "credential_image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hoursrequired"
  end

  add_index "credentials", ["user_id"], name: "index_credentials_on_user_id"

  create_table "hours", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "credential_id"
    t.integer  "course_id"
  end

  add_index "hours", ["course_id"], name: "index_hours_on_course_id"
  add_index "hours", ["credential_id"], name: "index_hours_on_credential_id"
  add_index "hours", ["user_id"], name: "index_hours_on_user_id"

  create_table "labels", force: true do |t|
    t.integer  "course_id"
    t.integer  "credential_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "labels", ["course_id"], name: "index_labels_on_course_id"
  add_index "labels", ["credential_id"], name: "index_labels_on_credential_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
