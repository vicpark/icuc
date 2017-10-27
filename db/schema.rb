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

ActiveRecord::Schema.define(version: 20171027204254) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "zernikes", force: :cascade do |t|
    t.integer  "z1"
    t.integer  "z2"
    t.integer  "z3"
    t.integer  "z4"
    t.integer  "z5"
    t.integer  "z6"
    t.integer  "z7"
    t.integer  "z8"
    t.integer  "z9"
    t.integer  "z10"
    t.integer  "z11"
    t.integer  "z12"
    t.integer  "z13"
    t.integer  "z14"
    t.integer  "z15"
    t.integer  "z16"
    t.integer  "z17"
    t.integer  "z18"
    t.integer  "z19"
    t.integer  "z20"
    t.integer  "z21"
    t.integer  "z22"
    t.integer  "z23"
    t.integer  "z24"
    t.integer  "z25"
    t.integer  "z26"
    t.integer  "z27"
    t.integer  "z28"
    t.integer  "z29"
    t.integer  "z30"
    t.integer  "z31"
    t.integer  "z32"
    t.integer  "z33"
    t.integer  "z34"
    t.integer  "z35"
    t.integer  "z36"
    t.integer  "z37"
    t.integer  "z38"
    t.integer  "z39"
    t.integer  "z40"
    t.integer  "z41"
    t.integer  "z42"
    t.integer  "z43"
    t.integer  "z44"
    t.integer  "z45"
    t.integer  "z46"
    t.integer  "z47"
    t.integer  "z48"
    t.integer  "z49"
    t.integer  "z50"
    t.integer  "z51"
    t.integer  "z52"
    t.integer  "z53"
    t.integer  "z54"
    t.integer  "z55"
    t.integer  "z56"
    t.integer  "z57"
    t.integer  "z58"
    t.integer  "z59"
    t.integer  "z60"
    t.integer  "z61"
    t.integer  "z62"
    t.integer  "z63"
    t.integer  "z64"
    t.integer  "z65"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

end
