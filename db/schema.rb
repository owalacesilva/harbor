# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2022_06_06_021935) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_accounts_on_role_id"
    t.index ["unlock_token"], name: "index_accounts_on_unlock_token", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "alternative_phone_number"
    t.string "company_name"
    t.string "postal_code"
    t.string "street_address"
    t.string "building_number"
    t.string "recipient"
    t.string "apartament"
    t.string "door_code"
    t.string "floor"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "state_abbr"
    t.string "country"
    t.string "country_code"
    t.string "latitude"
    t.string "longitude"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "banking_accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "bank_code"
    t.string "bank_name"
    t.string "account_type"
    t.string "branch_number"
    t.string "branch_code"
    t.string "account_number"
    t.string "account_code"
    t.string "holder_name"
    t.string "document_number"
    t.string "operation"
    t.index ["user_id"], name: "index_banking_accounts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "first_name", limit: 45, null: false
    t.string "last_name", limit: 45
    t.string "gender", limit: 9, default: "undefined", null: false
    t.date "birth_date"
    t.string "phone_number", limit: 45
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "reference_id", null: false
    t.string "code", limit: 45, null: false
    t.string "status", null: false
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "total", precision: 10, scale: 2, default: "0.0", null: false
    t.string "description"
    t.index ["reference_id"], name: "index_purchases_on_reference_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "references", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unique_name", limit: 45, null: false
    t.string "display_name", limit: 45
    t.string "description", limit: 255
    t.decimal "unit_price", precision: 10, scale: 2, default: "0.0", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unique_name", limit: 45, null: false
    t.string "display_name", limit: 45, null: false
    t.string "description", limit: 255
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code", limit: 45, null: false
    t.bigint "user_id", null: false
    t.bigint "origin_wallet_id", null: false
    t.bigint "target_wallet_id", null: false
    t.bigint "reference_id", null: false
    t.bigint "withdraw_id"
    t.bigint "purchase_id"
    t.string "operation", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.decimal "point_amount", precision: 10, scale: 2, null: false
    t.string "description"
    t.index ["origin_wallet_id"], name: "index_transactions_on_origin_wallet_id"
    t.index ["purchase_id"], name: "index_transactions_on_purchase_id"
    t.index ["reference_id"], name: "index_transactions_on_reference_id"
    t.index ["target_wallet_id"], name: "index_transactions_on_target_wallet_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
    t.index ["withdraw_id"], name: "index_transactions_on_withdraw_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "reference_id", null: false
    t.decimal "balance", precision: 10, scale: 2, default: "0.0"
    t.decimal "incomes", precision: 10, scale: 2, default: "0.0"
    t.decimal "expenses", precision: 10, scale: 2, default: "0.0"
    t.index ["reference_id"], name: "index_wallets_on_reference_id"
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  create_table "withdraws", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "wallet_id", null: false
    t.boolean "blocked", default: false, null: false
    t.date "blocked_at"
    t.boolean "approved", default: false, null: false
    t.date "approved_at"
    t.decimal "balance", precision: 10, scale: 2, default: "0.0"
    t.index ["user_id"], name: "index_withdraws_on_user_id"
    t.index ["wallet_id"], name: "index_withdraws_on_wallet_id"
  end

  add_foreign_key "accounts", "roles", on_update: :cascade, on_delete: :cascade
  add_foreign_key "addresses", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "banking_accounts", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "profiles", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "purchases", "\"references\"", column: "reference_id", on_update: :cascade, on_delete: :restrict
  add_foreign_key "purchases", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "transactions", "\"references\"", column: "reference_id", on_update: :cascade, on_delete: :restrict
  add_foreign_key "transactions", "purchases", on_update: :cascade, on_delete: :cascade
  add_foreign_key "transactions", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "transactions", "wallets", column: "origin_wallet_id", on_update: :cascade, on_delete: :restrict
  add_foreign_key "transactions", "wallets", column: "target_wallet_id", on_update: :cascade, on_delete: :restrict
  add_foreign_key "transactions", "withdraws", on_update: :cascade, on_delete: :cascade
  add_foreign_key "wallets", "\"references\"", column: "reference_id", on_update: :cascade, on_delete: :restrict
  add_foreign_key "wallets", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "withdraws", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "withdraws", "wallets", on_update: :cascade, on_delete: :cascade
end
