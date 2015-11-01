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

ActiveRecord::Schema.define(version: 20151101063602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string   "title"
    t.integer  "type"
    t.date     "due"
    t.decimal  "grade",      precision: 5, scale: 2
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "instructor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "username"
    t.integer  "course_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problems", force: :cascade do |t|
    t.integer  "number"
    t.string   "question"
    t.string   "student_answer"
    t.string   "correct_answer"
    t.integer  "type"
    t.integer  "assignment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["assignment_id"], name: "index_problems_on_assignment_id", using: :btree
  end

  create_table "slides", force: :cascade do |t|
    t.text     "content"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_slides_on_course_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email",                default: "", null: false
    t.string   "pid"
    t.string   "authentication_token"
    t.string   "password_digest"
    t.integer  "role"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["pid"], name: "index_users_on_pid", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "problems", "assignments"
  add_foreign_key "slides", "courses"
end
