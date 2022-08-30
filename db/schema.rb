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

ActiveRecord::Schema[7.1].define(version: 2022_08_30_174032) do
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

  create_table "document_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unique_name", limit: 45, null: false
    t.string "display_name", limit: 45, null: false
    t.string "description", limit: 255
  end

  create_table "documents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "document_type_id", null: false
    t.boolean "blocked", default: false, null: false
    t.date "blocked_at"
    t.boolean "approved", default: false, null: false
    t.date "approved_at"
    t.jsonb "image_data"
    t.index ["document_type_id"], name: "index_documents_on_document_type_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "graduations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unique_name", limit: 45, null: false
    t.string "display_name", limit: 45, null: false
    t.string "description", limit: 255
    t.decimal "volume", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "max_points_by_team", precision: 10, scale: 2, default: "0.0", null: false
  end

  create_table "nodes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "sponsor_node_id"
    t.bigint "parent_node_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", null: false
    t.decimal "points", precision: 10, scale: 2, default: "0.0", null: false
    t.index ["parent_node_id"], name: "index_nodes_on_parent_node_id"
    t.index ["sponsor_node_id"], name: "index_nodes_on_sponsor_node_id"
    t.index ["user_id"], name: "index_nodes_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "broadcast", default: false, null: false
    t.boolean "published", default: false, null: false
    t.boolean "opened", default: false, null: false
    t.string "title", null: false
    t.text "message", null: false
    t.string "url"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "point_distributions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "done", default: false
    t.decimal "base_value", precision: 10, scale: 2
    t.string "params"
    t.bigint "user_id", null: false
    t.bigint "reference_id", null: false
    t.bigint "purchase_id", null: false
    t.bigint "user_point_record_id", null: false
    t.index ["purchase_id"], name: "index_point_distributions_on_purchase_id"
    t.index ["reference_id"], name: "index_point_distributions_on_reference_id"
    t.index ["user_id"], name: "index_point_distributions_on_user_id"
    t.index ["user_point_record_id"], name: "index_point_distributions_on_user_point_record_id"
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

  create_table "qualifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unique_name", limit: 45, null: false
    t.string "display_name", limit: 45, null: false
    t.string "description", limit: 255
    t.decimal "volume", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "max_points_by_team", precision: 10, scale: 2, default: "0.0", null: false
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

  create_table "user_graduations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "graduation_id", null: false
    t.index ["graduation_id"], name: "index_user_graduations_on_graduation_id"
    t.index ["user_id"], name: "index_user_graduations_on_user_id"
  end

  create_table "user_point_records", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "origin_user_id", null: false
    t.bigint "reference_id", null: false
    t.date "record_date"
    t.decimal "base_value", precision: 10, scale: 2
    t.decimal "amount", precision: 10, scale: 2
    t.index ["origin_user_id"], name: "index_user_point_records_on_origin_user_id"
    t.index ["reference_id"], name: "index_user_point_records_on_reference_id"
    t.index ["user_id"], name: "index_user_point_records_on_user_id"
  end

  create_table "user_points", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "reference_id", null: false
    t.decimal "amount", precision: 10, scale: 2
    t.index ["reference_id"], name: "index_user_points_on_reference_id"
    t.index ["user_id", "reference_id"], name: "index_user_points_on_user_id_and_reference_id", unique: true
    t.index ["user_id"], name: "index_user_points_on_user_id"
  end

  create_table "user_qualifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "qualification_id", null: false
    t.index ["qualification_id"], name: "index_user_qualifications_on_qualification_id"
    t.index ["user_id"], name: "index_user_qualifications_on_user_id"
  end

  create_table "user_queues", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "user_sponsor_id", null: false
    t.boolean "done", default: false, null: false
    t.date "done_at"
    t.string "side", null: false
    t.index ["user_id"], name: "index_user_queues_on_user_id"
    t.index ["user_sponsor_id"], name: "index_user_queues_on_user_sponsor_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sponsor_id"
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
    t.index ["sponsor_id"], name: "index_users_on_sponsor_id"
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
  add_foreign_key "documents", "document_types", on_update: :cascade, on_delete: :restrict
  add_foreign_key "documents", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "nodes", "nodes", column: "parent_node_id", on_update: :cascade, on_delete: :nullify
  add_foreign_key "nodes", "nodes", column: "sponsor_node_id", on_update: :cascade, on_delete: :nullify
  add_foreign_key "nodes", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "notifications", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "point_distributions", "\"references\"", on_update: :cascade, on_delete: :restrict
  add_foreign_key "point_distributions", "purchases", on_update: :cascade, on_delete: :restrict
  add_foreign_key "point_distributions", "user_point_records", on_update: :cascade, on_delete: :restrict
  add_foreign_key "point_distributions", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "profiles", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "purchases", "\"references\"", on_update: :cascade, on_delete: :restrict
  add_foreign_key "purchases", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "transactions", "\"references\"", on_update: :cascade, on_delete: :restrict
  add_foreign_key "transactions", "purchases", on_update: :cascade, on_delete: :cascade
  add_foreign_key "transactions", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "transactions", "wallets", column: "origin_wallet_id", on_update: :cascade, on_delete: :restrict
  add_foreign_key "transactions", "wallets", column: "target_wallet_id", on_update: :cascade, on_delete: :restrict
  add_foreign_key "transactions", "withdraws", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_graduations", "graduations", on_update: :cascade, on_delete: :restrict
  add_foreign_key "user_graduations", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "user_point_records", "\"references\"", on_update: :cascade, on_delete: :restrict
  add_foreign_key "user_point_records", "users", column: "origin_user_id", on_update: :cascade, on_delete: :restrict
  add_foreign_key "user_point_records", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "user_points", "\"references\"", on_update: :cascade, on_delete: :restrict
  add_foreign_key "user_points", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "user_qualifications", "qualifications", on_update: :cascade, on_delete: :restrict
  add_foreign_key "user_qualifications", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "user_queues", "users", column: "user_sponsor_id", on_update: :cascade, on_delete: :restrict
  add_foreign_key "user_queues", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "users", "users", column: "sponsor_id", on_update: :cascade, on_delete: :restrict
  add_foreign_key "wallets", "\"references\"", on_update: :cascade, on_delete: :restrict
  add_foreign_key "wallets", "users", on_update: :cascade, on_delete: :restrict
  add_foreign_key "withdraws", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "withdraws", "wallets", on_update: :cascade, on_delete: :cascade
end
