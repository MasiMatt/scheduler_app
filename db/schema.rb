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

ActiveRecord::Schema.define(version: 20160410183723) do

  create_table "computer_sciences", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "course_group"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "course_data", force: :cascade do |t|
    t.string   "name"
    t.integer  "num"
    t.string   "title"
    t.integer  "credit"
    t.string   "prereg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "current_courses", force: :cascade do |t|
    t.integer  "course_datum_id"
    t.string   "year"
    t.string   "semester"
    t.string   "professor"
    t.string   "lecture_day"
    t.string   "lecture_time"
    t.string   "tutorial_day"
    t.string   "tutorial_time"
    t.string   "lab_day"
    t.string   "lab_time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "location"
  end

  create_table "software_engineerings", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "course_group"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "student_courses", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "current_course_id"
    t.string   "lecture_day"
    t.string   "lecture_time"
    t.string   "string"
    t.string   "tutorial_day"
    t.string   "tutorial_time"
    t.string   "lab_day"
    t.string   "lab_time"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "student_records", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.integer  "year"
    t.string   "semester"
    t.string   "grade"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "student_id"
    t.string   "email"
    t.string   "department"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_token"
  end

  add_index "students", ["remember_token"], name: "index_students_on_remember_token"

end
