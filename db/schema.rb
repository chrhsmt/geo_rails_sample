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

ActiveRecord::Schema.define(version: 20171022100848) do

  create_table "cordinates", force: :cascade do |t|
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "quadkey15",  limit: 255
    t.string   "quadkey22",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cordinates", ["latitude", "longitude"], name: "index_cordinates_on_latitude_and_longitude", using: :btree
  add_index "cordinates", ["latitude"], name: "index_cordinates_on_latitude", using: :btree
  add_index "cordinates", ["longitude"], name: "index_cordinates_on_longitude", using: :btree
  add_index "cordinates", ["quadkey15"], name: "index_cordinates_on_quadkey15", using: :btree
  add_index "cordinates", ["quadkey22"], name: "index_cordinates_on_quadkey22", using: :btree

end
