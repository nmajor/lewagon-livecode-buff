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

ActiveRecord::Schema.define(version: 20170710114158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "awards", force: :cascade do |t|
    t.integer  "merit_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_awards_on_group_id", using: :btree
    t.index ["merit_id"], name: "index_awards_on_merit_id", using: :btree
  end

  create_table "batches", force: :cascade do |t|
    t.integer  "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batchships", force: :cascade do |t|
    t.integer  "batch_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.index ["batch_id"], name: "index_batchships_on_batch_id", using: :btree
    t.index ["role"], name: "index_batchships_on_role", using: :btree
    t.index ["student_id"], name: "index_batchships_on_student_id", using: :btree
  end

  create_table "challenges", force: :cascade do |t|
    t.string   "desc"
    t.integer  "division_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["division_id"], name: "index_challenges_on_division_id", using: :btree
  end

  create_table "divisions", force: :cascade do |t|
    t.text     "groups"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "batch_id"
    t.index ["batch_id"], name: "index_divisions_on_batch_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "division_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "name"
    t.integer  "score",       default: 0
    t.index ["division_id"], name: "index_groups_on_division_id", using: :btree
  end

  create_table "groupships", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groupships_on_group_id", using: :btree
    t.index ["student_id"], name: "index_groupships_on_student_id", using: :btree
  end

  create_table "merits", force: :cascade do |t|
    t.string   "name"
    t.integer  "points"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "awards", "groups"
  add_foreign_key "awards", "merits"
  add_foreign_key "batchships", "batches"
  add_foreign_key "challenges", "divisions"
  add_foreign_key "divisions", "batches"
  add_foreign_key "groups", "divisions"
  add_foreign_key "groupships", "groups"
  add_foreign_key "groupships", "students"
end
