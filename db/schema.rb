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

ActiveRecord::Schema.define(version: 2022_02_15_022337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classes", force: :cascade do |t|
    t.string "name"
    t.string "week_day"
    t.time "start_time"
    t.string "address"
    t.float "monthly_fee"
    t.float "daily_fee"
    t.integer "status", default: 0, null: false
    t.datetime "canceled_at"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "classes_id"
    t.bigint "subscription_id"
    t.datetime "date", null: false
    t.float "amount", null: false
    t.index ["classes_id"], name: "index_payments_on_classes_id"
    t.index ["subscription_id"], name: "index_payments_on_subscription_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "presences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "classes_id", null: false
    t.datetime "date", null: false
    t.integer "payment_type", null: false
    t.index ["classes_id"], name: "index_presences_on_classes_id"
    t.index ["user_id"], name: "index_presences_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "classes_id", null: false
    t.date "expires_at"
    t.float "price"
    t.date "start_date", null: false
    t.integer "status", default: 0, null: false
    t.integer "available_make_ups", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classes_id"], name: "index_subscriptions_on_classes_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "name", null: false
    t.string "email"
    t.string "phone"
    t.string "encrypted_password"
    t.integer "status", default: 0, null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  add_foreign_key "payments", "users"
  add_foreign_key "presences", "classes", column: "classes_id"
  add_foreign_key "presences", "users"
  add_foreign_key "subscriptions", "classes", column: "classes_id"
  add_foreign_key "subscriptions", "users"
end
