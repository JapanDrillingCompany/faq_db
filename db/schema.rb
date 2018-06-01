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

ActiveRecord::Schema.define(version: 20140616010402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "publicity_helps", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publicity_qa_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publicity_qas", force: :cascade do |t|
    t.string   "category1"
    t.string   "category2"
    t.text     "question"
    t.text     "answer"
    t.text     "note"
    t.integer  "qa_category_id"
    t.integer  "user_id"
    t.string   "reffile_file_name"
    t.string   "reffile_content_type"
    t.integer  "reffile_file_size"
    t.datetime "reffile_updated_at"
    t.integer  "classification_type_id"
    t.integer  "category_type_id"
    t.integer  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "answerer"
  end

  add_index "publicity_qas", ["qa_category_id"], name: "index_publicity_qas_on_qa_category_id", using: :btree

end
