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

ActiveRecord::Schema.define(version: 2018_09_05_122202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.string "icon"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_activities_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "title"
    t.string "email_domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "title"
    t.string "note"
    t.bigint "participant_id"
    t.bigint "point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_equipment_on_participant_id"
    t.index ["point_id"], name: "index_equipment_on_point_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "point_id"
    t.bigint "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_messages_on_participant_id"
    t.index ["point_id"], name: "index_messages_on_point_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id"
    t.bigint "point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "invited"
    t.index ["point_id"], name: "index_participants_on_point_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "point_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "points", force: :cascade do |t|
    t.integer "price"
    t.integer "number_min"
    t.integer "number_max"
    t.string "address"
    t.string "type_of_point"
    t.integer "level_min"
    t.integer "level_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "user_activity_id"
    t.float "latitude"
    t.float "longitude"
    t.datetime "date"
    t.boolean "full", default: false, null: false
    t.bigint "point_group_id"
    t.index ["point_group_id"], name: "index_points_on_point_group_id"
    t.index ["user_activity_id"], name: "index_points_on_user_activity_id"
    t.index ["user_id"], name: "index_points_on_user_id"
  end

  create_table "user_activities", force: :cascade do |t|
    t.integer "level"
    t.string "description"
    t.bigint "user_id"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_user_activities_on_activity_id"
    t.index ["user_id"], name: "index_user_activities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.string "first_name"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "categories"
  add_foreign_key "equipment", "participants"
  add_foreign_key "equipment", "points"
  add_foreign_key "messages", "participants"
  add_foreign_key "messages", "points"
  add_foreign_key "participants", "points"
  add_foreign_key "participants", "users"
  add_foreign_key "points", "point_groups"
  add_foreign_key "points", "user_activities"
  add_foreign_key "points", "users"
  add_foreign_key "user_activities", "activities"
  add_foreign_key "user_activities", "users"
  add_foreign_key "users", "companies"
end
