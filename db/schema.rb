# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_07_100459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cash_managements", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "month", null: false
    t.string "year", null: false
    t.integer "cash_in_cents", default: 0, null: false
    t.string "cash_in_currency", default: "USD", null: false
    t.integer "cash_out_cents", default: 0, null: false
    t.string "cash_out_currency", default: "USD", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id", "month", "year"], name: "index_cash_managements_on_company_id_and_month_and_year", unique: true
    t.index ["company_id"], name: "index_cash_managements_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "country", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "initial_cash_cents", default: 0, null: false
    t.string "initial_cash_currency", default: "USD", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.integer "role", default: 0, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cash_managements", "companies"
  add_foreign_key "companies", "users"
end
