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

ActiveRecord::Schema.define(version: 2020_09_04_040212) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "doctor"
    t.string "address"
    t.string "phone_number"
    t.string "image_id"
    t.text "official_site"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultation_hours", force: :cascade do |t|
    t.integer "clinic_id"
    t.string "week_time"
    t.string "mo_time"
    t.string "tu_time"
    t.string "we_time"
    t.string "th_time"
    t.string "fr_time"
    t.string "sa_time"
    t.string "su_time"
    t.string "ho_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_consultation_hours_on_clinic_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.string "member_id"
    t.string "clinic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genre_maps", force: :cascade do |t|
    t.string "clinic_id"
    t.string "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "postcode"
    t.string "address"
    t.date "birthday"
    t.boolean "sex"
    t.boolean "is_deleted", default: false
    t.integer "prefecture_code"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.string "member_id"
    t.string "clinic_id"
    t.string "title"
    t.text "comment"
    t.integer "wating_time", default: 0
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
